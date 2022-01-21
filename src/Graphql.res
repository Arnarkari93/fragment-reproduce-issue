@@warning("-20")

%graphql(`
  fragment ProducingCountries on countries {
    country
  }

  fragment OtherFruitFields on Fruits {
    family
  }

  query Fruits {
    fruits {
      id
      fruit_name
      producing_countries {
        ...ProducingCountries
      }
      ...OtherFruitFields
    }
  }
`)

// adding OtherFruitsFiles fragment to Fruits query will break build
// complaining that the GraphQL_PPX module can't be found
