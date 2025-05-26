# Terraform AWS Modulaarne Projekt

**Kirjeldus:**  
Modulaarne AWS infrastruktuur Terraformiga – VPC, turvagruppide haldus, EC2 instants, RDS andmebaas, monitooring ja alarmid.

## Struktuur
- `modules/` — iseseisvad moodulid (vpc, security, ec2, rds, monitoring)  
- `main.tf` — peamine konfiguratsioon moodulite ühendamiseks  
- `variables.tf` — globaalsete muutujate definitsioon (vajadusel)  
- `outputs.tf` — väljundväärtused (VPC ID, EC2 IP, RDS endpoint)  
- `README.md` — projekti dokumentatsioon ja kasutusjuhis  

## Nõuded
- Terraform >= 1.0  
- AWS CLI konfigureeritud profiil (access_key, secret_key, piirkond)  
- Kohalik SSH võtmepargi (.pub) tee õiges asukohas  

## Paigaldus ja kasutus
1. **Klooni repo**:
   ```bash
   git clone https://github.com/sinu-kasutaja/terraform-project.git
   cd terraform-project

------------------------------------------------------------------------------------

Turvapõhimõtted

    Kasuta least-privilege põhimõtet IAM rollides ja poliitikates.

    Keela avalik juurdepääs S3 bucketele.

    Luba SSH ainult spetsiifilistest CIDR-plokkidest.

    Seadista CloudWatch alarmid ja SNS teavitused CPU, RDS ja võrgu mõõdikute jaoks.

    Hoia Terraform state turvaliselt S3/DynamoDB taga.