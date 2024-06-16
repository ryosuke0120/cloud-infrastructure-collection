# フォルダ構成

```
terraform/
├── modules/
│   ├── cloud_run/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   ├── service_account/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   ├── iam/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
├── dev/
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   ├── backend.tf
├── stg/
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   ├── backend.tf
├── prd/
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   ├── backend.tf
├── provider.tf
├── versions.tf
```

# ファイルの役割

- provider.tf
  - Terraform のプロバイダーを定義するファイル
  - これがないと Terraform がどのクラウドプロバイダーを使うかわからない
- versions.tf
  - Terraform のバージョンを指定するファイル
  - これがないと Terraform がどのバージョンを使うかわからない
- main.tf
  - リソースを定義するファイル
  - ここにリソースを追加することで、リソースを作成できる
- variables.tf
  - 変数を定義するファイル
  - ここに変数を追加することで、変数を使うことができる
- outputs.tf
  - 出力を定義するファイル
  - ここに出力を追加することで、他のリソースに値を渡すことができる
