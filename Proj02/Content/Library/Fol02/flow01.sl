namespace: flows

flow:
name: encode\_and\_probe\_url
inputs:
\- base\_url
\- raw\_path\_segment
\- attempts
workflow:
\- encode\_path:
do:
io.cloudslang.base.http.url\_encoder:
\- data: '${ raw\_path\_segment }'
\- safe: '${ "" }'
publish:
\- encoded\_segment: '${ result }'
\- error\_message: '${ error\_message }'
navigate:
\- SUCCESS: probe\_endpoint
\- FAILURE: FAILURE
\- probe\_endpoint:
do:
io.cloudslang.base.http.verify\_url\_is\_accessible:
\- url: '${ base\_url + "/" + encoded\_segment }'
\- attempts: '${ attempts }'
publish:
\- probe\_result: '${ return\_result }'
\- error\_message: '${ error\_message }'
navigate:
\- SUCCESS: SUCCESS
\- FAILURE: FAILURE
outputs:
\- probed\_url: '${ base\_url + "/" + encoded\_segment }'
\- probe\_result: '${ probe\_result }'
\- error\_message: '${ error\_message }'
results:
\- SUCCESS
\- FAILURE
