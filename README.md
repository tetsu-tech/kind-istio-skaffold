## links

- 参考記事
  - https://developers.10antz.co.jp/archives/1006
- kind
  - https://kind.sigs.k8s.io/docs/user/quick-start/
- istioctl
  - https://istio.io/latest/docs/setup/getting-started/

## logs

<details>
<summary>
ログ
</summary>

```bash
~/hoge/kind-istio-skaffold % ./bin/kind create cluster
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.20.2) 🖼
 ✓ Preparing nodes 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Have a question, bug, or feature request? Let us know! https://kind.sigs.k8s.io/#community 🙂

~/hoge/kind-istio-skaffold % ./bin/istioctl manifest apply
This will install the Istio 1.10.0  profile with ["Istio core" "Istiod" "Ingress gateways"] components into the cluster. Proceed? (y/N) y
✔ Istio core installed
- Processing resources for Istiod. Waiting for Deployment/istio-system/istiod
- Processing resources for Istiod. Waiting for Deployment/istio-system/istiod
- Processing resources for Istiod. Waiting for Deployment/istio-system/istiod
- Processing resources for Istiod. Waiting for Deployment/istio-system/istiod

✔ Istiod installed
✔ Ingress gateways installed
✔ Installation complete

~/hoge/kind-istio-skaffold % kubectl get pod -A
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
istio-system         istio-ingressgateway-649cb76797-925n8        1/1     Running   0          78s
istio-system         istiod-787d9846cf-h9z79                      1/1     Running   0          115s

~/hoge/kind-istio-skaffold % skaffold dev
Listing files to watch...
 - hellowd
Generating tags...
 - hellowd -> hellowd:2d0d697-dirty
Checking cache...
 - hellowd: Found Locally
Starting test...
Tags used in deployment:
 - hellowd -> hellowd:d1eaaffb428b9415ccb2945898d48702e5f626b1bd6ccb7d8bcd46a7e4edcb66
Loading images into kind cluster nodes...
 - hellowd:d1eaaffb428b9415ccb2945898d48702e5f626b1bd6ccb7d8bcd46a7e4edcb66 -> Found
Images loaded in 66.678927ms
Starting deploy...
 - namespace/kind-test created
 - deployment.apps/hellowd created
Waiting for deployments to stabilize...
 - kind-test:deployment/hellowd is ready.
Deployments stabilized in 3.295 seconds
Press Ctrl+C to exit
Watching for changes...
[hellowd] Hello world!
[hellowd] Hello world!
[hellowd] Hello world!
[istio-proxy] 2021-04-25T03:02:16.930447Z	info	FLAG: --concurrency="2"
[istio-proxy] 2021-04-25T03:02:16.930547Z	info	FLAG: --domain="kind-test.svc.cluster.local"
[istio-proxy] 2021-04-25T03:02:16.930560Z	info	FLAG: --help="false"
[istio-proxy] 2021-04-25T03:02:16.930571Z	info	FLAG: --log_as_json="false"
[istio-proxy] 2021-04-25T03:02:16.930582Z	info	FLAG: --log_caller=""
[istio-init] Environment:
[istio-init] ------------
[istio-init] ENVOY_PORT=
[istio-init] INBOUND_CAPTURE_PORT=
[istio-proxy] 2021-04-25T03:02:16.930592Z	info	FLAG: --log_output_level="default:info"
[istio-proxy] 2021-04-25T03:02:16.930603Z	info	FLAG: --log_rotate=""
[istio-proxy] 2021-04-25T03:02:16.930613Z	info	FLAG: --log_rotate_max_age="30"
[istio-proxy] 2021-04-25T03:02:16.930624Z	info	FLAG: --log_rotate_max_backups="1000"
[istio-proxy] 2021-04-25T03:02:16.930635Z	info	FLAG: --log_rotate_max_size="104857600"
[istio-init] ISTIO_INBOUND_INTERCEPTION_MODE=
[istio-init] ISTIO_INBOUND_TPROXY_MARK=
[istio-init] ISTIO_INBOUND_TPROXY_ROUTE_TABLE=
[istio-init] ISTIO_INBOUND_PORTS=
[istio-init] ISTIO_OUTBOUND_PORTS=
[istio-init] ISTIO_LOCAL_EXCLUDE_PORTS=
[istio-init] ISTIO_SERVICE_CIDR=
[istio-init] ISTIO_SERVICE_EXCLUDE_CIDR=
[istio-init] ISTIO_META_DNS_CAPTURE=
[istio-init]
[istio-proxy] 2021-04-25T03:02:16.930642Z	info	FLAG: --log_stacktrace_level="default:none"
[istio-proxy] 2021-04-25T03:02:16.930663Z	info	FLAG: --log_target="[stdout]"
[istio-proxy] 2021-04-25T03:02:16.930675Z	info	FLAG: --meshConfig="./etc/istio/config/mesh"
[istio-init] Variables:
[istio-init] ----------
[istio-init] PROXY_PORT=15001
[istio-init] PROXY_INBOUND_CAPTURE_PORT=15006
[istio-init] PROXY_TUNNEL_PORT=15008
[istio-init] PROXY_UID=1337
[istio-init] PROXY_GID=1337
[istio-proxy] 2021-04-25T03:02:16.930704Z	info	FLAG: --outlierLogPath=""
[istio-proxy] 2021-04-25T03:02:16.930714Z	info	FLAG: --proxyComponentLogLevel="misc:error"
[istio-proxy] 2021-04-25T03:02:16.930725Z	info	FLAG: --proxyLogLevel="warning"
[istio-proxy] 2021-04-25T03:02:16.930736Z	info	FLAG: --serviceCluster="hellowd.kind-test"
[istio-init] INBOUND_INTERCEPTION_MODE=REDIRECT
[istio-init] INBOUND_TPROXY_MARK=1337
[istio-proxy] 2021-04-25T03:02:16.930746Z	info	FLAG: --stsPort="0"
[istio-proxy] 2021-04-25T03:02:16.930752Z	info	FLAG: --templateFile=""
[istio-proxy] 2021-04-25T03:02:16.930764Z	info	FLAG: --tokenManagerPlugin="GoogleTokenExchange"
[istio-init] INBOUND_TPROXY_ROUTE_TABLE=133
[istio-proxy] 2021-04-25T03:02:16.930774Z	info	Version 1.10.0-alpha.0-4c05baca64f773fbabbcb2b34b1824ff65f4cbff-Clean
[istio-init] INBOUND_PORTS_INCLUDE=*
[istio-proxy] 2021-04-25T03:02:16.930949Z	info	Proxy role	ips=[10.244.0.8 fe80::bc34:afff:fe06:a245] type=sidecar id=hellowd-59c9c65bd7-6q59d.kind-test domain=kind-test.svc.cluster.local
[istio-proxy] 2021-04-25T03:02:16.931025Z	info	Apply proxy config from env {}
[istio-proxy]
[istio-proxy] 2021-04-25T03:02:16.931746Z	info	Effective config: binaryPath: /usr/local/bin/envoy
[istio-proxy] concurrency: 2
[istio-proxy] configPath: ./etc/istio/proxy
[istio-init] INBOUND_PORTS_EXCLUDE=15090,15021,15020
[istio-init] OUTBOUND_IP_RANGES_INCLUDE=*
[istio-proxy] controlPlaneAuthPolicy: MUTUAL_TLS
[istio-proxy] discoveryAddress: istiod.istio-system.svc:15012
[istio-proxy] drainDuration: 45s
[istio-proxy] parentShutdownDuration: 60s
[istio-proxy] proxyAdminPort: 15000
[istio-proxy] serviceCluster: hellowd.kind-test
[istio-proxy] statNameLength: 189
[istio-init] OUTBOUND_IP_RANGES_EXCLUDE=
[istio-init] OUTBOUND_PORTS_INCLUDE=
[istio-proxy] statusPort: 15020
[istio-proxy] terminationDrainDuration: 5s
[istio-init] OUTBOUND_PORTS_EXCLUDE=
[istio-proxy] tracing:
[istio-init] KUBEVIRT_INTERFACES=
[istio-init] ENABLE_INBOUND_IPV6=false
[istio-init] DNS_CAPTURE=false
[istio-init] DNS_SERVERS=[],[]
[istio-init]
[istio-init] Writing following contents to rules file:  /tmp/iptables-rules-1619319736298355500.txt062975288
[istio-init] * nat
[istio-init] -N ISTIO_INBOUND
[istio-proxy]   zipkin:
[istio-proxy]     address: zipkin.istio-system:9411
[istio-proxy]
[istio-init] -N ISTIO_REDIRECT
[istio-init] -N ISTIO_IN_REDIRECT
[istio-init] -N ISTIO_OUTPUT
[istio-proxy] 2021-04-25T03:02:16.931779Z	info	JWT policy is third-party-jwt
[istio-proxy] 2021-04-25T03:02:16.931797Z	info	Pilot SAN: [istiod.istio-system.svc]
[istio-init] -A ISTIO_INBOUND -p tcp --dport 15008 -j RETURN
[istio-init] -A ISTIO_REDIRECT -p tcp -j REDIRECT --to-ports 15001
[istio-init] -A ISTIO_IN_REDIRECT -p tcp -j REDIRECT --to-ports 15006
[istio-init] -A PREROUTING -p tcp -j ISTIO_INBOUND
[istio-init] -A ISTIO_INBOUND -p tcp --dport 22 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp --dport 15090 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp --dport 15021 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp --dport 15020 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp -j ISTIO_IN_REDIRECT
[istio-proxy] 2021-04-25T03:02:16.931809Z	info	CA Endpoint istiod.istio-system.svc:15012, provider Citadel
[istio-proxy] 2021-04-25T03:02:16.931843Z	info	Using CA istiod.istio-system.svc:15012 cert with certs: var/run/secrets/istio/root-cert.pem
[istio-init] -A OUTPUT -p tcp -j ISTIO_OUTPUT
[istio-proxy] 2021-04-25T03:02:16.931949Z	info	citadelclient	Citadel client using custom root cert: istiod.istio-system.svc:15012
[istio-init] -A ISTIO_OUTPUT -o lo -s 127.0.0.6/32 -j RETURN
[istio-init] -A ISTIO_OUTPUT -o lo ! -d 127.0.0.1/32 -m owner --uid-owner 1337 -j ISTIO_IN_REDIRECT
[istio-init] -A ISTIO_OUTPUT -o lo -m owner ! --uid-owner 1337 -j RETURN
[istio-init] -A ISTIO_OUTPUT -m owner --uid-owner 1337 -j RETURN
[istio-proxy] 2021-04-25T03:02:16.955595Z	info	ads	All caches have been synced up in 31.5909ms, marking server ready
[istio-init] -A ISTIO_OUTPUT -o lo ! -d 127.0.0.1/32 -m owner --gid-owner 1337 -j ISTIO_IN_REDIRECT
[istio-init] -A ISTIO_OUTPUT -o lo -m owner ! --gid-owner 1337 -j RETURN
[istio-init] -A ISTIO_OUTPUT -m owner --gid-owner 1337 -j RETURN
[istio-init] -A ISTIO_OUTPUT -d 127.0.0.1/32 -j RETURN
[istio-init] -A ISTIO_OUTPUT -j ISTIO_REDIRECT
[istio-init] COMMIT
[istio-init]
[istio-init] iptables-restore --noflush /tmp/iptables-rules-1619319736298355500.txt062975288
[istio-init] Writing following contents to rules file:  /tmp/ip6tables-rules-1619319736301031300.txt983336247
[istio-proxy] 2021-04-25T03:02:16.955899Z	info	sds	SDS server for workload certificates started, listening on "./etc/istio/proxy/SDS"
[istio-proxy] 2021-04-25T03:02:16.955930Z	info	xdsproxy	Initializing with upstream address "istiod.istio-system.svc:15012" and cluster "Kubernetes"
[istio-init]
[istio-init] ip6tables-restore --noflush /tmp/ip6tables-rules-1619319736301031300.txt983336247
[istio-init] iptables-save
[istio-init] # Generated by iptables-save v1.6.1 on Sun Apr 25 03:02:16 2021
[istio-init] *nat
[istio-init] :PREROUTING ACCEPT [0:0]
[istio-init] :INPUT ACCEPT [0:0]
[istio-init] :OUTPUT ACCEPT [0:0]
[istio-init] :POSTROUTING ACCEPT [0:0]
[istio-init] :ISTIO_INBOUND - [0:0]
[istio-init] :ISTIO_IN_REDIRECT - [0:0]
[istio-init] :ISTIO_OUTPUT - [0:0]
[istio-init] :ISTIO_REDIRECT - [0:0]
[istio-init] -A PREROUTING -p tcp -j ISTIO_INBOUND
[istio-init] -A OUTPUT -p tcp -j ISTIO_OUTPUT
[istio-init] -A ISTIO_INBOUND -p tcp -m tcp --dport 15008 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp -m tcp --dport 22 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp -m tcp --dport 15090 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp -m tcp --dport 15021 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp -m tcp --dport 15020 -j RETURN
[istio-init] -A ISTIO_INBOUND -p tcp -j ISTIO_IN_REDIRECT
[istio-init] -A ISTIO_IN_REDIRECT -p tcp -j REDIRECT --to-ports 15006
[istio-proxy] 2021-04-25T03:02:16.956049Z	info	sds	Start SDS grpc server
[istio-init] -A ISTIO_OUTPUT -s 127.0.0.6/32 -o lo -j RETURN
[istio-init] -A ISTIO_OUTPUT ! -d 127.0.0.1/32 -o lo -m owner --uid-owner 1337 -j ISTIO_IN_REDIRECT
[istio-init] -A ISTIO_OUTPUT -o lo -m owner ! --uid-owner 1337 -j RETURN
[istio-init] -A ISTIO_OUTPUT -m owner --uid-owner 1337 -j RETURN
[istio-init] -A ISTIO_OUTPUT ! -d 127.0.0.1/32 -o lo -m owner --gid-owner 1337 -j ISTIO_IN_REDIRECT
[istio-init] -A ISTIO_OUTPUT -o lo -m owner ! --gid-owner 1337 -j RETURN
[istio-init] -A ISTIO_OUTPUT -m owner --gid-owner 1337 -j RETURN
[istio-init] -A ISTIO_OUTPUT -d 127.0.0.1/32 -j RETURN
[istio-init] -A ISTIO_OUTPUT -j ISTIO_REDIRECT
[istio-init] -A ISTIO_REDIRECT -p tcp -j REDIRECT --to-ports 15001
[istio-init] COMMIT
[istio-proxy] 2021-04-25T03:02:16.956147Z	info	Opening status port 15020
[istio-proxy] 2021-04-25T03:02:16.965912Z	info	Starting proxy agent
[istio-proxy] 2021-04-25T03:02:16.965961Z	info	Epoch 0 starting
[istio-proxy] 2021-04-25T03:02:16.967906Z	info	Envoy command: [-c etc/istio/proxy/envoy-rev0.json --restart-epoch 0 --drain-time-s 45 --drain-strategy immediate --parent-shutdown-time-s 60 --service-cluster hellowd.kind-test --service-node sidecar~10.244.0.8~hellowd-59c9c65bd7-6q59d.kind-test~kind-test.svc.cluster.local --local-address-ip-version v4 --bootstrap-version 3 --disable-hot-restart --log-format %Y-%m-%dT%T.%fZ	%lenvoy %n	%v -l warning --component-log-level misc:error --concurrency 2]
[istio-proxy] 2021-04-25T03:02:17.036286Z	info	xdsproxy	connected to upstream XDS server: istiod.istio-system.svc:15012
[istio-init] # Completed on Sun Apr 25 03:02:16 2021
[istio-proxy] 2021-04-25T03:02:17.053951Z	info	ads	ADS: new connection for node:sidecar~10.244.0.8~hellowd-59c9c65bd7-6q59d.kind-test~kind-test.svc.cluster.local-1
[istio-proxy] 2021-04-25T03:02:17.053985Z	info	ads	ADS: new connection for node:sidecar~10.244.0.8~hellowd-59c9c65bd7-6q59d.kind-test~kind-test.svc.cluster.local-2
[istio-proxy] 2021-04-25T03:02:17.101182Z	info	cache	generated new workload certificate	latency=145.0547ms ttl=23h59m59.8988344s
[istio-proxy] 2021-04-25T03:02:17.101237Z	info	cache	Root cert has changed, start rotating root cert
[istio-proxy] 2021-04-25T03:02:17.101265Z	info	ads	XDS: Incremental Pushing:0 ConnectedEndpoints:2 Version:
[istio-proxy] 2021-04-25T03:02:17.101344Z	info	cache	returned workload trust anchor from cache	ttl=23h59m59.8986693s
[istio-proxy] 2021-04-25T03:02:17.101459Z	info	cache	returned workload trust anchor from cache	ttl=23h59m59.8985942s
[istio-proxy] 2021-04-25T03:02:17.101668Z	info	cache	returned workload certificate from cache	ttl=23h59m59.8983524s
[istio-proxy] 2021-04-25T03:02:17.102568Z	info	sds	SDS: PUSH	resource=default
[istio-proxy] 2021-04-25T03:02:17.102598Z	info	sds	SDS: PUSH	resource=ROOTCA
[istio-proxy] 2021-04-25T03:02:17.103143Z	info	cache	returned workload trust anchor from cache	ttl=23h59m59.8968696s
[istio-proxy] 2021-04-25T03:02:17.103276Z	info	sds	SDS: PUSH	resource=ROOTCA
[istio-proxy] 2021-04-25T03:02:18.837397Z	info	Initialization took 1.9103468s
[istio-proxy] 2021-04-25T03:02:18.837489Z	info	Envoy proxy is ready
[hellowd] Hello world!
[hellowd] Hello world!
[hellowd] Hello world!
[hellowd] Hello world!
[hellowd] Hello world!
^CCleaning up...
 - namespace "kind-test" deleted
 - deployment.apps "hellowd" deleted

```

</details>

