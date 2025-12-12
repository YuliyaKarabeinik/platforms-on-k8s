kind create cluster --name dev --config cluster.yaml \
#kind load docker-image inside the script below might not work. Ignore the errors and go ahead.
./kind-load.sh \

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml \

helm install conference oci://docker.io/salaboy/conference-app \
--version v1.0.0 \
-f values.yaml

kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80 