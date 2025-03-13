## Jinja in dbt

Combining SQL with Jinja can be very useful in dbt, as Jinja is a templating language. Here are some ways Jinja can be utilized in a dbt project:

- Use control structures (e.g., `if` statements and `for` loops) in SQL to dynamically generate queries.
- Utilize environment variables in your dbt project for production deployments.
- Modify how your project builds based on the current target environment.
- Operate on the results of one query to generate another query, for example:
  - Return a list of payment methods to create a subtotal column per payment method (pivot).
  - Return a list of columns from two relations and select them in the same order to facilitate union operations.
- Abstract snippets of SQL into reusable macros — these are analogous to functions in most programming languages.

### Syntax

- `{{ ... }}`: Used to print strings, reference variables, and call macros.
- `{% ... %}`: Control flow structures; place your `for` loops and `if` statements inside.
- `{# ... #}`: Comment out code segments to prevent them from executing or outputting a string. Do not use `--` for comments in Jinja.

### Learning References

- [dbt docs on Jinja](https://docs.getdbt.com/docs/build/jinja-macros)
- [dbt Learn lecture video on Jinja](https://learn.getdbt.com/learn/course/jinja-macros-and-packages/getting-started-with-jinja-40min/jinja-basics?page=4)
  - [learn_jina] (https://github.com/lilizhoou/dbt-projects/blob/main/Jinja/learn_jinja.sql)
  - [exercise](https://github.com/lilizhoou/dbt-projects/blob/main/Jinja/exercise.sql)
