@react.component
let make = () => {
  let queryResult = Graphql.Fruits.use()

  switch queryResult {
  | {data: Some({fruits: Some(fruits)})} =>
    <ul>
      {fruits
      ->Array.map(fruit => {
        switch fruit {
        | Some({id: Some(id), fruit_name: Some(name)}) => <li key={id}> {name->React.string} </li>
        | _ => React.null
        }
      })
      ->React.array}
    </ul>
  | _ => "Data loading or failed"->React.string
  }
}

// export default
let default = make
