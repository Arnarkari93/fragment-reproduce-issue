module Fruits = {
  @react.component
  let make = () => {
    let queryResult = Graphql.Fruits.use(Graphql.Fruits.makeVariables())

    switch queryResult {
    | {data: Some({fruits: Some(fruits)})} =>
      <ul>
        {fruits
        ->Array.map(fruit => {
          switch fruit {
          | Some({id: Some(id), fruit_name: Some(name)}) => {
              let family =
                fruit
                ->Option.flatMap(f => f.otherFruitFields.family)
                ->Option.getWithDefault("unknown")
              <li key={id}> {`${name} is in the ${family} family`->React.string} </li>
            }
          | _ => React.null
          }
        })
        ->React.array}
      </ul>
    | _ => "Data loading or failed"->React.string
    }
  }
}

@react.component
let make = () => {
  let cache = ApolloClient.Cache.InMemoryCache.make()
  let client = ApolloClient.make(~uri=_ => "https://fruits-api.netlify.app/graphql", ~cache, ())
  <ApolloClient.React.ApolloProvider client> <Fruits /> </ApolloClient.React.ApolloProvider>
}

// export default
let default = make
