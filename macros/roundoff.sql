{% macro round_price(column_name, decimal_places=2)%}
    round(
        cast({{column_name}} as numeric),
        {{decimal_places}}
    )
{% endmacro %}

{% macro normalize_status(status_col) %}
    case
        when {{ status_col }} in ('O') then 'completed'
        when {{ status_col }} in ('F') then 'cancelled'
        else 'pending'
    end
{% endmacro %}
