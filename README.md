# terraform-talos-demo

We need 3 VM's to run Talos on:
```
for i in $(seq 3); do
  sudo virt-install \
    --name k8s-talos-oss-0${i} \
    --os-variant linux2022 \
    --vcpus 3 \
    --ram 6144 \
    --cdrom /home/$USER/tmp/metal-amd64.iso \
    --console "pty,target_type=virtio" \
    --disk "format=qcow2,sparse=true,size=20,device=disk,bus=virtio" \
    --disk "format=qcow2,sparse=true,size=20,device=disk,bus=virtio" \
    --graphics vnc
done
```


for demo purposes we will be using the password `DemoPW`:
```
htpasswd -nbBC 10 "" DemoPW | tr -d ':\n' | sed 's/$2y/$2a/'
```

Troubleshooting argocd when the ingress is not ready:
```
kubectl -n argocd port-forward svc/argocd-server 10443:443
```