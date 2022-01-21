@@warning("-20")

%graphql(`
  fragment OtherFruitFields on Fruits {
    family
  }

  query Fruits {
    fruits {
      id
      fruit_name
      ...OtherFruitFields
    }
  }
`)

// adding OtherFruitsFiles fragment to Fruits query will break build
// complaining that the GraphQL_PPX module can't be found
