namespace: flows

flow:
  name: encode_and_probe_url

  inputs:
    - base_url
    - raw_path_segment
    - attempts

  tasks:
    encode_path:
      do:
        io.cloudslang.base.http.url_encoder:
          - data: '${ raw_path_segment }'
          - safe: ''
      publish:
        - encoded_segment: '${ result }'
        - error_message: '${ error_message }'
      navigate:
        - SUCCESS: probe_endpoint
        - FAILURE: FAILURE

    probe_endpoint:
      do:
        io.cloudslang.base.http.verify_url_is_accessible:
          - url: '${ base_url + "/" + encoded_segment }'
          - attempts: '${ attempts }'
      publish:
        - probe_result: '${ return_result }'
        - error_message: '${ error_message }'
      navigate:
        - SUCCESS: SUCCESS
        - FAILURE: FAILURE

  outputs:
    - probed_url: '${ base_url + "/" + encoded_segment }'
    - probe_result: '${ probe_result }'
    - error_message: '${ error_message }'

  results:
    - SUCCESS
    - FAILURE