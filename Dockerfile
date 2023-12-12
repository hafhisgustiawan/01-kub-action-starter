FROM node:14-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 8080

CMD [ "node", "app.js" ]

#  CEK DOKUMENTASI MINIKUBE UNTUK LANGKAH2 NYA KITA NGIKUT DARI SITU SEMUA

# KUBERNETES AKAN MEMANAGE CONTAINER SEHINGGA AKAN AUTO RESTART KETIKA CRASH, ITU UDAH DEFAULT DAN SANGAT BERGUNA

# UNTUK START MINIKUBE CLUSTER : minikube start

# UNTUK MENJALANKAN DASHBOARD : minikube dashboard

# ADA BEBERAPA OBJECT YANG DIPELAJARI PADA SECTION INI, YAITU deployment dan service

# UNTUK MELIHAT ARSITEKTUR CEK VIDEO 189

# UNTUK MEMBUAT DEPLOYMENT (gunakan image yang sudah di build dan push ke sebuah registry seperti docker hub) : kubectl create deployment nama_deployment --image=hafhisgustiawan/image:latest. DEPLOYMENT INI OTOMATIS AKAN MEMBUAT SEBUAH PODS, DIMANA PODS ITU SEBAGAI WADAH UNTUK MENJALANKAN CONTAINER

# CEK DEPLOYMENT YANG ADA : kubectl get deployments

# CEK PODS YANG ADA : kubectl get pods

# KEMUDIAN SECARA DEFAULT, IP CLUSTER AKAN DIBUAT, TETAPI TIDAK DENGAN EXTERNAL IP, CEK : kubectl get services
# TETAPI INI GAKBISA DI AKSES DARI LUAR SEBELUM DI EXPOSE DENGAN CARA BUAT SERVICE BARU

# BUAT SERVICE BARU UNTUK MENGEKSPOSE PORT DARI DALAM CLUSTER AGAR BISA DI AKSES DARI LUAR : kubectl expose deployment nama_deployment --type=LoadBalancer --port=8080. Pastikan port itu yang di listen di kodingan

# SELANJUTNYA CEK : kubectl get setvices. Disitu ada external ip yang bisa digunakan, jika gak ada : minikube service nama_deployment

# SCALING SANGAT BERGUNA KETIKA ADA TRAFFIC YANG TINGGI : kubectl scale deployment/nama_deployment --replicas=3

# CEK ROLLOUT HISTORY : kubectl rollout history deployment/nama_deployment

# CEK ROLLOUT HISTORY SECARA DETAIL : kubectl rollout history deployment/nama_deployment --revision=nomer_revisi_waktu_cek

# ROLLBACK KE DEPLOYMENT SEBELUMNYA : kubectl undo deployment/nama_deployment --to-revision=nomer_revisi_waktu_cek

# HAPUS SERVICE : kubectl delete service nama_deployment

# HAPUS DEPLOYMENT : kubectl deployment nama_deployment

