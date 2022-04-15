# sample-scheduler-framework

This repo is a sample for Kubernetes scheduler framework.

# Doc 

[基于kubernetes调度框架的自定义调度器实现](https://blog.csdn.net/fly910905/article/details/124000222)

## 0-Bulid

### Exception: k8s.io/api@v0.0.0: reading k8s.io/api/go.mod at revision v0.0.0: unknown revision v0.0.0

错误的原因是**在kubernetes主仓中，也使用了公共库，不过`go.mod`文件中所有公共库版本都指定为了v0.0.0（显然这个版本不存在）**， 然后通过**Go Module的replace**机制，将版本替换为子目录`./staging/src/k8s.io`对应的依赖。

**解决方案**

```bash
./hack/get-k8s-as-dep.sh v1.18.6
```

执行过程

```bash
FLY@DESKTOP-EI66F9D MINGW64 /d/go/workspace/github.com/kubernetes/sheduler/sample-scheduler-framework (fly/dev)
$ ./hack/get-k8s-as-dep.sh v1.18.6
+ MODS=($(
    curl -sS "https://raw.githubusercontent.com/kubernetes/kubernetes/v${VERSION}/go.mod" |
        sed -n 's|.*k8s.io/\(.*\) => ./staging/src/k8s.io/.*|k8s.io/\1|p'
))
++ curl -sS https://raw.githubusercontent.com/kubernetes/kubernetes/v1.18.6/go.mod
++ sed -n 's|.*k8s.io/\(.*\) => ./staging/src/k8s.io/.*|k8s.io/\1|p'


FLY@DESKTOP-EI66F9D MINGW64 /d/go/workspace/github.com/kubernetes/sheduler/sample-scheduler-framework (fly/dev)
$ ./hack/get-k8s-as-dep.sh v1.18.6
+ MODS=($(
    curl -sS "https://raw.githubusercontent.com/kubernetes/kubernetes/v${VERSION}/go.mod" |
        sed -n 's|.*k8s.io/\(.*\) => ./staging/src/k8s.io/.*|k8s.io/\1|p'
))
++ curl -sS https://raw.githubusercontent.com/kubernetes/kubernetes/v1.18.6/go.mod
++ sed -n 's|.*k8s.io/\(.*\) => ./staging/src/k8s.io/.*|k8s.io/\1|p'
curl: (56) OpenSSL SSL_read: Connection was reset, errno 10054

FLY@DESKTOP-EI66F9D MINGW64 /d/go/workspace/github.com/kubernetes/sheduler/sample-scheduler-framework (fly/dev)
$ ./hack/get-k8s-as-dep.sh v1.18.6
+ MODS=($(
    curl -sS "https://raw.githubusercontent.com/kubernetes/kubernetes/v${VERSION}/go.mod" |
        sed -n 's|.*k8s.io/\(.*\) => ./staging/src/k8s.io/.*|k8s.io/\1|p'
))
++ curl -sS https://raw.githubusercontent.com/kubernetes/kubernetes/v1.18.6/go.mod
++ sed -n 's|.*k8s.io/\(.*\) => ./staging/src/k8s.io/.*|k8s.io/\1|p'
curl: (28) Failed to connect to raw.githubusercontent.com port 443 after 21052 ms: Timed out

FLY@DESKTOP-EI66F9D MINGW64 /d/go/workspace/github.com/kubernetes/sheduler/sample-scheduler-framework (fly/dev)
$ ./hack/get-k8s-as-dep.sh v1.18.6
+ MODS=($(
    curl -sS "https://raw.githubusercontent.com/kubernetes/kubernetes/v${VERSION}/go.mod" |
        sed -n 's|.*k8s.io/\(.*\) => ./staging/src/k8s.io/.*|k8s.io/\1|p'
))
++ curl -sS https://raw.githubusercontent.com/kubernetes/kubernetes/v1.18.6/go.mod
++ sed -n 's|.*k8s.io/\(.*\) => ./staging/src/k8s.io/.*|k8s.io/\1|p'
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/api@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/api=k8s.io/api@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/apiextensions-apiserver@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/apiextensions-apiserver=k8s.io/apiextensions-apiserver@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/apimachinery@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.7-rc.0
+ go mod edit -replace=k8s.io/apimachinery=k8s.io/apimachinery@v0.18.7-rc.0
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/apiserver@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/apiserver=k8s.io/apiserver@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/cli-runtime@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/cli-runtime=k8s.io/cli-runtime@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/client-go@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/client-go=k8s.io/client-go@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/cloud-provider@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/cloud-provider=k8s.io/cloud-provider@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/cluster-bootstrap@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/cluster-bootstrap=k8s.io/cluster-bootstrap@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/code-generator@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.18-rc.0
+ go mod edit -replace=k8s.io/code-generator=k8s.io/code-generator@v0.18.18-rc.0
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/component-base@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/component-base=k8s.io/component-base@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/cri-api@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.18-rc.0
+ go mod edit -replace=k8s.io/cri-api=k8s.io/cri-api@v0.18.18-rc.0
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/csi-translation-lib@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/csi-translation-lib=k8s.io/csi-translation-lib@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/kube-aggregator@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/kube-aggregator=k8s.io/kube-aggregator@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/kube-controller-manager@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/kube-controller-manager=k8s.io/kube-controller-manager@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/kube-proxy@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/kube-proxy=k8s.io/kube-proxy@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/kube-scheduler@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/kube-scheduler=k8s.io/kube-scheduler@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/kubectl@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/kubectl=k8s.io/kubectl@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/kubelet@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/kubelet=k8s.io/kubelet@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/legacy-cloud-providers@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/legacy-cloud-providers=k8s.io/legacy-cloud-providers@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/metrics@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/metrics=k8s.io/metrics@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/sample-apiserver@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/sample-apiserver=k8s.io/sample-apiserver@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/sample-cli-plugin@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/sample-cli-plugin=k8s.io/sample-cli-plugin@v0.18.6
+ for MOD in "${MODS[@]}"
++ go mod download -json k8s.io/sample-controller@kubernetes-1.18.6
++ sed -n 's|.*"Version": "\(.*\)".*|\1|p'
+ V=v0.18.6
+ go mod edit -replace=k8s.io/sample-controller=k8s.io/sample-controller@v0.18.6
+ go get k8s.io/kubernetes@v1.18.6
+ go mod download

```

参考： [如何将k8s.io/kubernetes包导入你的项目](https://blog.csdn.net/fly910905/article/details/123973786)

## 1-Deploy

```shell
$ kubectl apply -f deploy/sample-scheduler.yaml
```

## Test
```shell
$ kubectl apply -f deploy/test-scheduler.yaml
```

Then watch sample-scheduler pod logs.
