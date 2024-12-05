
## Data Flow
1. **Source Layer**: Raw data from FakeStore API stored in Snowflake
2. **Staging Layer**: Clean and standardized data, ready for consumption downstream
3. **Consumption Layer**: Machine learning-ready features for price prediction

## Models

### Source (1_source)
- **Products Source**: Raw products data from FakeStore API containing basic product information
  - Located in `source_fakestoreapi.raw.products`

### Staging (2_transformation)
- **Products Staging**: Cleaned and typed product data with standardized column names
  - Transforms raw JSON into structured columns
  - Handles data type conversions
  - Standardizes naming conventions

### Machine Learning (3_consumption)
- **Products ML Dataset**: Feature-engineered dataset for price prediction
  - Features include:
    - Category (encoded numerically)
    - Product description length
    - Title length
    - Rating metrics
  - Target variable: price_usd