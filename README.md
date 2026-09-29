# AWS Infrastructure as Code - Projekt 1

Portfolio projekt demonstrující Infrastructure as Code (IaC) v AWS pomocí Terraformu.

## 🎯 Business Problem

Firma potřebuje bezpečné, automatizované a opakovatelné cloudové prostředí pro svou aplikaci. Manuální konfigurace v AWS konzoli je náchylná k chybám, špatně se dokumentuje a nedá se reprodukovat.

Tento projekt řeší tento problém pomocí **Terraformu** – veškerá infrastruktura je definována jako kód, verzována v Gitu a nasazena automatizovaně.

## 🏗️ Architektura


## 🛠️ Použité technologie

- **Terraform** – Infrastructure as Code
- **AWS** – VPC, EC2, NAT Gateway, IAM, VPC Endpoints
- **Bash** – user_data skript pro bootstrap
- **S3 + DynamoDB** – remote state a zámek

## 🔑 Klíčová rozhodnutí

| Rozhodnutí | Důvod |
|-----------|-------|
| EC2 v privátní podsíti | Bezpečnost – není přímo dostupná z internetu |
| SSM Session Manager místo SSH | Žádné SSH klíče, plný audit, funguje v privátní síti |
| VPC Interface Endpoints pro SSM | Provoz neopouští AWS síť, nižší latence |
| S3 Gateway Endpoint | Zdarma, umožňuje `dnf` stahovat balíčky |
| Remote state v S3 | Sdílení v týmu, přežije ztrátu počítače |
| DynamoDB / S3 lockfile | Zámek proti konfliktům při paralelním `apply` |
| `user_data` s `sleep 60` | Dá VPC endpointům čas na propagaci |
| `prevent_destroy` na S3 | Bootstrap prostředek se nikdy nemaže |

## 📁 Struktura projektu


## 🚀 Jak nasadit

### Předpoklady

- Terraform >= 1.0.0
- AWS CLI nakonfigurované (`aws configure`)
- AWS účet s oprávněním vytvářet VPC, EC2, IAM, S3

### Postup

1. **Klonuj repozitář:**
   ```bash
   git clone https://github.com/mareksimk-png/projekt-1-aws-iac.git
   cd projekt-1-aws-iac


**Ulož.**

---

**Napiš mi:**
1. Výstup z `git --version`.
2. Jestli jsi nastavil `user.name` a `user.email`.
3. Jestli jsi vytvořil `terraform.tfvars.example` a README.md.

**Pak uděláme první commit a push na GitHub. 💪**