#!/usr/bin/env bash
# Execute every SQL script against the MySQL server on 127.0.0.1:3306 and report pass/fail per file.
#   * data/classicmodels.sql is loaded first (it creates the classicmodels database)
#   * scripts run in course order, from the repo root
#   * `--force` keeps going after an error so every error of a script is counted
set -u
MYSQL=(mysql -h 127.0.0.1 -P 3306 -uroot -proot --force --default-character-set=utf8mb4)

echo "Loading the sample database..."
"${MYSQL[@]}" < data/classicmodels.sql > /dev/null 2> /tmp/load.err || true
if grep -q "^ERROR" /tmp/load.err; then echo "classicmodels.sql failed:"; head -5 /tmp/load.err; exit 1; fi
"${MYSQL[@]}" -N -e "SELECT CONCAT('classicmodels loaded: ', COUNT(*), ' customers') FROM classicmodels.customers"

mapfile -t SCRIPTS < <(
  { ls 00-quickstart/*.sql; ls 0[1-6]-*/*.sql; } 2>/dev/null | sort
)

pass=0; fail=0
summary="${GITHUB_STEP_SUMMARY:-/dev/null}"
{
  echo "## SQL run on MySQL 8.0"; echo
  echo "| Script | Result | Errors |"; echo "|---|:-:|--:|"
} > "$summary"
details=""

for f in "${SCRIPTS[@]}"; do
  "${MYSQL[@]}" < "$f" > /dev/null 2> /tmp/script.err || true
  n=$(grep -c "^ERROR" /tmp/script.err || true)
  if [ "$n" -eq 0 ]; then
    echo "PASSED  $f"; pass=$((pass+1)); echo "| \`$f\` | ✅ passed | 0 |" >> "$summary"
  else
    echo "FAILED  $f ($n errors)"; fail=$((fail+1)); echo "| \`$f\` | ❌ failed | $n |" >> "$summary"
    grep "^ERROR" /tmp/script.err | head -4 | sed 's/^/        | /'
    details+=$'\n'"<details><summary><code>$f</code></summary>"$'\n\n```\n'"$(grep '^ERROR' /tmp/script.err | head -8)"$'\n```\n\n</details>\n'
  fi
done

echo; echo "Summary: $pass passed, $fail failed, $((pass+fail)) total"
{ echo; echo "**$pass passed · $fail failed** (of $((pass+fail)) scripts)"; [ -n "$details" ] && { echo; echo "### Errors"; echo "$details"; }; } >> "$summary"
[ "$fail" -eq 0 ]
