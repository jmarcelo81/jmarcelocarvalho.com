# 🌐 jmarcelocarvalho.com

A personal portfolio website built with **Flask**, **Docker**, and **PostgreSQL**, running on a self-hosted Ubuntu server. The project showcases my skills in web development, DevOps, containerization, and cloud security.

> 🎯 **Goal**: Host a secure, scalable, and production-ready website as a living project to showcase to employers.

---

## 🚀 Features

- 🐍 Python + Flask web application
- 🐳 Containerized with Docker
- 🗃️ PostgreSQL database (via Docker)
- 🔐 Secret management with `.env`
- 🌍 Planned AWS EC2 deployment with HTTPS (Let's Encrypt)
- 📄 Contact form saving to CSV (starter feature)
- ⚙️ GitHub Actions (CI/CD workflow coming soon)
- 📚 Articles, projects, and hobbies page
- 💡 Plans to scale with Kubernetes and subdomains

---

## 🧰 Tech Stack

| Layer         | Tools / Technologies         |
|---------------|------------------------------|
| Backend       | Python, Flask                |
| Frontend      | HTML, CSS (custom), Jinja2   |
| Database      | PostgreSQL (Docker)          |
| DevOps        | Docker, GitHub Actions       |
| Hosting       | Self-hosted (dev), AWS EC2 (prod) |
| Security      | SSH keys, .env, HTTPS planned |

---

## 📸 Screenshots

Coming soon — will include home page, projects, and form submission confirmation.

---

## 🛠️ Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/jmarcelo81/jmarcelocarvalho.com.git
   cd jmarcelocarvalho.com```

2. Create a .env file:
   ```FLASK_SECRET_KEY=your-secret-key
   DATABASE_URL=postgresql://user:password@postgres:5432/dbname```

3. Build the Docker image:
   ```docker build -t jmarcelocarvalho-app .```

4. Run the containers:
   ```docker network create web-net

docker run -d \
  --name postgres \
  --network web-net \
  -e POSTGRES_USER=user \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_DB=perfectspot \
  -v pgdata:/var/lib/postgresql/data \
  postgres:15

docker run -d \
  --name web-app \
  --network web-net \
  -p 80:5000 \
  --env-file .env \
  jmarcelocarvalho-app```

---

## 📌 To Do

- [x] Add `.env` secret loading
- [x] Create public GitHub repo
- [ ] Add GitHub Actions workflow
- [ ] Add Nginx + Let's Encrypt on EC2
- [ ] Add dynamic DB usage for questionnaire subdomain
- [ ] Automate PostgreSQL volume backups

---

## 📜 License
MIT License

---
## 🧑‍💻 Author
Marcelo Carvalho
🛡️ SysAdmin | Cybersecurity Student | Cloud Enthusiast
🌎 jmarcelocarvalho.com
📫 LinkedIn
📝 Portfolio in progress!
