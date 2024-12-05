WITH base AS (

    SELECT * FROM {{ source('source_fakestoreapi__raw', 'products') }}

),

transformation AS (

    SELECT

        content:category::STRING AS category,
        content:description::STRING AS product_description,
        content:id::NUMBER AS id,
        content:image::STRING AS product_image,
        content:price::FLOAT AS price_usd,
        content:rating.count::NUMBER AS rating_count,
        content:rating.rate::FLOAT AS rating_rate,
        content:title::STRING AS title

    FROM base

),

final AS (

    SELECT

        -- primary key
        content:id::NUMBER AS id,

        -- strings
        content:category::STRING AS category,
        content:description::STRING AS product_description,
        content:image::STRING AS product_image,
        content:title::STRING AS title,
        
        -- numerics
        content:rating.count::NUMBER AS rating_count,
        content:rating.rate::FLOAT AS rating_rate,
        content:price::FLOAT AS price_usd,
        
    FROM base

)

SELECT * FROM final