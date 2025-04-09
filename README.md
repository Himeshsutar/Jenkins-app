🚀 TASK 2: Create a Simple Jenkins Pipeline for CI/CD

✅ Objective

Set up a basic Jenkins pipeline to automate the process of building, testing, and deploying a Node.js application using Docker.

🛠️ Tools & Technologies

Jenkins

Docker

Node.js

GitHub (SCM)

Jenkins Pipeline (Declarative syntax)

📁 Project Structure

project-root/
├── app.js
├── Dockerfile
├── Jenkinsfile
├── package.json
└── README.md

🔧 Steps Performed

🔹 a. Install Jenkins

Jenkins was installed locally using Docker:

docker run -d --name jenkins-docker --dns=8.8.8.8 -p 8080:8080 -p 50000:50000 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
jenkins/jenkins:lts


🔹 b. Create Jenkinsfile
A Jenkinsfile was created in the root directory of the project, defining build, test, and deploy stages.

🔹 c. Configure Jenkins to Trigger on Code Commit
Configured Jenkins job as Pipeline from SCM.

Linked GitHub repository containing the Jenkinsfile.

(Optional) Set up a webhook on GitHub for auto-triggering the pipeline.

🔹 d. Add Stages

✅ Build – Installs Node.js dependencies.

✅ Test – Placeholder for test scripts.

✅ Deploy – Builds Docker image and runs container on port 3000.

🔹 e. Test the Pipeline

Code pushed to GitHub triggered the pipeline.

Jenkins executed all stages successfully.

Application deployed and accessible at:

http://localhost:3000