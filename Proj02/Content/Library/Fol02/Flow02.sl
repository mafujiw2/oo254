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
        navigate:
          - failure: FAILURE
          - success: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      SQLCommand:
        x: 200
        'y': 80
        navigate:
          9ae09f98-9342-ca33-2f2b-1e70fc5ccf19:
            targetId: 2e3e78f7-ffbb-115a-00b2-4ad51ff333b9
            port: success
          f1cb0f6b-ce16-d85e-0321-4b822a5c046b:
            targetId: 29d58530-50bc-9657-069a-4910ac8457c9
            port: failure
    results:
      SUCCESS:
        2e3e78f7-ffbb-115a-00b2-4ad51ff333b9:
          x: 80
          'y': 120
      FAILURE:
        29d58530-50bc-9657-069a-4910ac8457c9:
          x: 480
          'y': 120
