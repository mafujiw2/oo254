namespace: Fol02
flow:
  name: Flow02
  workflow:
    - SQLCommand:
        do_external:
          f37316bf-b185-4533-919e-d4dc7deacd7a:
            - DBServerName: TaiALM17New
            - Username: sa
            - Password:
                value: Pass@word1
                sensitive: true
            - Database: under_line
        navigate: []
  results: []
extensions:
  graph:
    steps:
      SQLCommand:
        x: 200
        'y': 80
