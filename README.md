### 배포 후 꼭 실행 (추후 이것까지 자동으로 배포할 수 있음)
# kubectl apply --server-side -f karpenter.yaml

### scale-up 테스트
# kubectl apply -f example.yaml

# kubectl scale deployment inflate --replicas=3

# kubectl get node

# kubectl delete -f example.yaml