# 🌐 jmarcelocarvalho.com - Personal Website Project (v1.0)

## ✨ Overview
A secure and scalable personal website built using **Flask**, **Docker**, and **PostgreSQL**, deployed on **AWS EC2**, and protected by **Cloudflare, UFW**, and **CrowdSec**.

> ✅ Live: [https://jmarcelocarvalho.com](https://jmarcelocarvalho.com)
>
> 📄 GitHub Repo: [github.com/jmarcelo81/jmarcelocarvalho.com](https://github.com/jmarcelo81/jmarcelocarvalho.com)

---

## 🔧 Tech Stack

| Layer              | Technology                                 |
|--------------------|--------------------------------------------|
| Backend            | Python (Flask)                             |
| Frontend           | HTML, CSS, Jinja2 templates                |
| Containerization   | Docker                                     |
| Reverse Proxy      | Nginx with Let's Encrypt (SSL)             |
| Database (Planned) | PostgreSQL                                 |
| DNS + WAF          | Cloudflare                                 |
| Security           | UFW, CrowdSec, Cloudflare WAF              |
| Hosting            | AWS EC2 (Ubuntu 24.04)                     |
| CI/CD              | GitHub Actions (build/test pipeline ready) |

---

## 📍 Environments

### 🏠 Dev
- Hosted behind **OPNsense Firewall** on a **Docker VM**
- Home Lab with Hyper-V

### ☀️ Prod
- Hosted on AWS EC2 (t3.micro)
- Deployed with Docker
- SSL managed by Certbot using **Cloudflare DNS challenge**

---

## 🛡️ Security Features

| Feature               | Description                                              |
|-----------------------|----------------------------------------------------------|
| UFW                   | Only essential ports (80, 443) are open to the public    |
| CrowdSec              | Real-time intrusion detection and auto-banning           |
| Cloudflare WAF        | OWASP ruleset, Bot Fight Mode, and Rate Limiting         |
| DNS-based SSL         | Certificates auto-renew via Cloudflare API               |
| robots.txt            | Prevents search engines from indexing sensitive paths    |

---

## 🚀 GitHub Actions (CI/CD)
- Validates Docker builds
- Future plan: auto-deploy to EC2 using SSH or GitHub Runner

---

## 📅 Timeline
- ✅ Local Dev: Ubuntu + Docker behind OPNsense
- ✅ Deployed to AWS EC2
- ✅ Configured Cloudflare for DNS + SSL
- ✅ Hardened with UFW + CrowdSec
- ✅ Added GitHub CI/CD pipeline

---

## 📸 Screenshots
Add relevant screenshots here:
- Home Page
- Articles / Projects / Hobbies Sections
- `docker ps` output
- Cloudflare dashboard (WAF / Rate Limiting)
- CrowdSec decision list
- GitHub Actions passing build

---

## 🔍 Future Improvements
- Integrate the subdomain questionnaire app
- Use PostgreSQL as backend DB
- Add visitor analytics (e.g. Plausible)
- Expand CI/CD to deploy on push
- Add monitoring and uptime alerting

---

## 🌟 About
Built by Marcelo Carvalho as a personal branding and documentation project to showcase real-world sysadmin and DevSecOps skills. Deployed in a production-grade environment using industry best practices.

---

## 💎 License
This project is open-source and licensed under the MIT License.

---

*Thank you for checking out this project! Feel free to explore the code, provide feedback, or get in touch on [LinkedIn](https://www.linkedin.com/in/jmarcelo-carvalho/).*

