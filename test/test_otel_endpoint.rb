require 'test_helper'


class TestOtelEndpoint < MiniTest::Test
  def test_create_otel_endpoint
    client = Prophecy::Client.new 'http://localhost:8080/api/', 'v1'
    testing_ep = Prophecy::Endpoint.new
    testing_ep.metadata = {}
    testing_ep.metadata.name = 'firstendpoint'
    testing_ep.metadata.namespace = 'default'
    testing_ep.subsets = [{ 'addresses' => [{ 'ip' => '172.17.0.25' }], 'ports' =>
                              [{ 'name' => 'https',
                                 'port' => 6443,
                                 'protocol' => 'TCP' }] }]

    req_body = "{\"metadata\":{\"name\":\"myendpoint\",\"namespace\":\"default\"}," \
        "\"subsets\":[{\"addresses\":[{\"ip\":\"172.17.0.25\"}],\"ports\":[{\"name\":\"https\"," \
    "\"port\":6443,\"protocol\":\"TCP\"}]}],\"kind\":\"Endpoints\",\"apiVersion\":\"v1\"}"

    stub_request(:post, 'http://localhost:8080/api/v1/namespaces/default/otelendpoint')
      .with(body: req_body)
      .to_return(body: open_test_file('created_otel_endpoint.json'), status: 201)

    created_ep = client.create_otel_endpoint testing_ep
    assert_equal('Otel Endpoints', created_ep.kind)
  end
end
