SELECT
    -- Primary Key
    id,

    ---
    ------------ Features
    ---
    -- We use ordinal ordering in a way that is positively correlated with the product price
    CASE 
        WHEN TRIM(category) = 'women''s clothing' THEN 1
        WHEN TRIM(category) = 'men''s clothing' THEN 2
        WHEN TRIM(category) = 'jewelery' THEN 3
        WHEN TRIM(category) = 'electronics' THEN 4
        ELSE -1
    END AS category_numeric,

    -- We extract the string length signal from the production description
    LENGTH(TRIM(product_description)) AS product_description_length,

    -- We extract the string length signal from the production title
    LENGTH(TRIM(title)) AS title_length,

    rating_count,

    rating_rate,

    ---
    ------------ Target
    ---
    price_usd as target_price_usd

FROM TRANSFORMATION_STAGING.FAKESTOREAPI.stg_products