{% snapshot customers_snapshot %}
{{ config(
    target_schema='snapshots',
    unique_key='customer_id',
    strategy='timestamp',
    updated_at='updated_at'


)}}

select
  customer_id,
  customer_name,
  state,
  updated_at
FROM {{ source('raw','customers') }}

{% endsnapshot %}