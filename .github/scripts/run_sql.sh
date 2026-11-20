#!/usr/bin/env bash
# Execute every SQL script against the MySQL server on 127.0.0.1:3306 and report pass/fail per file.
#   * every script starts from a clean server: all non-system databases dropped, classicmodels reloaded
#   * some lecture scripts continue the previous one (PRELUDE) or expect a schema chosen in Workbench (DEFAULT_DB)
#   * `--force` keeps going after an error so every error of a script is counted
set -u
MYSQL=(mysql -h 127.0.0.1 -P 3306 -uroot -proot --force --default-character-set=utf8mb4)

# scripts that build on earlier ones: script -> files to run first (space separated)
declare -A PRELUDE=(
  ["01-sql-basics/03-dml-and-dql-practice.sql"]=".github/sql/prelude-company.sql"
  ["01-sql-basics/04-tcl-and-dcl.sql"]=".github/sql/prelude-company.sql"
  ["04-employee-management-project/02-check-normalization-forms.sql"]="04-employee-management-project/01-database.sql"
  ["04-employee-management-project/03-dml-practice-insert.sql"]="04-employee-management-project/01-database.sql"
  ["04-employee-management-project/04-full-features.sql"]="04-employee-management-project/01-database.sql"
  ["05-final-projects/02-part-2.sql"]="05-final-projects/01-part-1.sql"
  ["05-final-projects/03-part-3.sql"]="05-final-projects/01-part-1.sql 05-final-projects/02-part-2.sql"
  ["05-final-projects/04-data-prep-for-ml.sql"]="05-final-projects/01-part-1.sql 05-final-projects/02-part-2.sql 05-final-projects/03-part-3.sql"
)
# scripts that do not contain a USE statement: the schema Workbench had selected
declare -A DEFAULT_DB=(
  ["01-sql-basics/04-tcl-and-dcl.sql"]="company"
  ["03-advanced-sql/07-view.sql"]="classicmodels"
  ["04-employee-management-project/03-dml-practice-insert.sql"]="employee_management"
  ["06-advanced-sql-scripts/02-group-by-subquery-math-string.sql"]="classicmodels"
  ["06-advanced-sql-scripts/05-indexes.sql"]="classicmodels"
  ["06-advanced-sql-scripts/06-query-optimization.sql"]="classicmodels"
  ["06-advanced-sql-scripts/07-window-cte-views-stored-procedures.sql"]="classicmodels"
)
# lecture scripts whose later examples refer to objects that the script itself dropped or never created:
# their errors are reported but do not fail the run
ILLUSTRATIVE=" 01-sql-basics/02-dml-and-dql.sql "

reset_server() {
  "${MYSQL[@]}" -N -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN ('mysql','sys','information_schema','performance_schema')" 2>/dev/null |
    while read -r db; do "${MYSQL[@]}" -e "DROP DATABASE \`$db\`" 2>/dev/null; done
  "${MYSQL[@]}" < data/classicmodels.sql > /dev/null 2> /tmp/load.err
  if grep -q "^ERROR" /tmp/load.err; then echo "classicmodels.sql failed to load:"; head -5 /tmp/load.err; exit 1; fi
}

run_file() {  # file [default_db]
  if [ -n "${2:-}" ]; then "${MYSQL[@]}" "$2" < "$1" > /dev/null 2> /tmp/script.err || true
  else "${MYSQL[@]}" < "$1" > /dev/null 2> /tmp/script.err || true; fi
}

reset_server
"${MYSQL[@]}" -N -e "SELECT CONCAT('classicmodels loaded: ', COUNT(*), ' customers, MySQL ', VERSION()) FROM classicmodels.customers"

mapfile -t SCRIPTS < <( { ls 00-quickstart/*.sql; ls 0[1-6]-*/*.sql; } 2>/dev/null | sort )

pass=0; fail=0; illu=0
summary="${GITHUB_STEP_SUMMARY:-/dev/null}"
{ echo "## SQL run on MySQL 8.0"; echo; echo "| Script | Result | Errors |"; echo "|---|:-:|--:|"; } > "$summary"
details=""

for f in "${SCRIPTS[@]}"; do
  reset_server
  for p in ${PRELUDE[$f]:-}; do run_file "$p"; done   # preludes create their own databases
  run_file "$f" "${DEFAULT_DB[$f]:-}"
  n=$(grep -c "^ERROR" /tmp/script.err || true)
  if [ "$n" -eq 0 ]; then
    echo "PASSED  $f"; pass=$((pass+1)); echo "| \`$f\` | ✅ passed | 0 |" >> "$summary"
  elif [[ "$ILLUSTRATIVE" == *" $f "* ]]; then
    echo "NOTE    $f ($n errors in illustrative examples)"; illu=$((illu+1)); echo "| \`$f\` | ℹ️ illustrative | $n |" >> "$summary"
    grep "^ERROR" /tmp/script.err | head -3 | sed 's/^/        | /'
  else
    echo "FAILED  $f ($n errors)"; fail=$((fail+1)); echo "| \`$f\` | ❌ failed | $n |" >> "$summary"
    grep "^ERROR" /tmp/script.err | head -4 | sed 's/^/        | /'
    details+=$'\n'"<details><summary><code>$f</code></summary>"$'\n\n```\n'"$(grep '^ERROR' /tmp/script.err | head -8)"$'\n```\n\n</details>\n'
  fi
done

echo; echo "Summary: $pass passed, $fail failed, $illu illustrative, $((pass+fail+illu)) total"
{ echo; echo "**$pass passed · $fail failed · $illu illustrative** (of $((pass+fail+illu)) scripts)"; [ -n "$details" ] && { echo; echo "### Errors"; echo "$details"; }; } >> "$summary"
[ "$fail" -eq 0 ]
