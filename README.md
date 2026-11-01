# Agentic AI Chatbot

A chatbot project I've been building using Python, Google Gemini, LangChain and LangGraph.

I wanted to go beyond a basic chatbot that simply takes a prompt and returns an answer. So I started working on an agent-based system where the model can use different tools, search uploaded documents, maintain conversation history and retrieve stored information.

The project is still evolving, and I'm continuing to improve its architecture and features as I learn more about Agentic AI.

**Live Demo:** https://agentic-ai-chatbot-v3sa.onrender.com

## What I've Built

- Chat interface with streaming responses.
- Google Gemini integration with support for multiple models.
- LangGraph-based agent workflow.
- Tool calling for web search and calculations.
- Document upload and retrieval using RAG.
- PDF and DOCX document support.
- ChromaDB for vector storage.
- Conversation history and long-term memory.
- SQLite database for storing conversations and messages.
- Docker support for running the application.
- GitHub Actions workflow for automated Docker builds and publishing.

## Tech Stack

| Technology | Usage |
|---|---|
| Python | Main programming language |
| FastAPI | Backend |
| Google Gemini | Language model |
| LangChain | LLM integration |
| LangGraph | Agent workflow |
| ChromaDB | Vector database |
| SQLite | Conversation storage |
| SQLAlchemy | Database operations |
| Tavily | Web search |
| Docker | Containerization |
| GitHub Actions | CI/CD |
| Render | Deployment |

## How It Works

The user interacts with the chatbot through the web interface. FastAPI handles the requests and passes them to the LangGraph agent.

The agent uses Gemini to process the request and can use available tools when needed.

Some of the tools I've implemented include:

- **Web Search:** Search the web using Tavily.
- **Calculator:** Perform mathematical calculations.
- **Document Search:** Retrieve relevant information from uploaded documents.
- **Memory:** Store and recall information from previous conversations.

For document-based questions, uploaded files are processed and stored in ChromaDB so that relevant information can be retrieved later.

Conversation history and long-term memory are stored using SQLite.

## Project Structure

```text
agentic-ai-chatbot/
│
├── .github/
│   └── workflows/
│       └── cicd.yaml
│
├── templates/
│   ├── index.html
│   └── index_backup.html
│
├── app.py
├── agents.py
├── tools.py
├── rag.py
├── database.py
│
├── requirements.txt
├── Dockerfile
├── compose.yaml
├── .dockerignore
├── .env.example
├── .gitignore
├── LICENSE
└── README.md
```

## Running Locally

### 1. Clone the repository

```bash
git clone https://github.com/shantanuchapke400-crypto/agentic-ai-chatbot.git

cd agentic-ai-chatbot
```

### 2. Create a virtual environment

```bash
python -m venv .venv
```

Activate it:

**Windows:**
```powershell
.venv\Scripts\Activate.ps1
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure environment variables

Create a `.env` file in the root directory using `.env.example` as a reference.

Add your own API credentials:

```env
GOOGLE_API_KEY=your_google_api_key
GEMINI_MODEL=gemini-3.8-flash

TAVILY_API_KEY=your_tavily_api_key

LANGSMITH_TRACING=false
LANGSMITH_ENDPOINT=https://api.smith.langchain.com
LANGSMITH_API_KEY=your_langsmith_api_key
LANGSMITH_PROJECT=agentic-ai-chatbot
```

Keep your actual API keys private. Never push your `.env` file to GitHub.

### 5. Start the application

```bash
uvicorn app:app --reload
```

Open the application:

http://127.0.0.1:8000

API documentation:

http://127.0.0.1:8000/docs

## Running with Docker

Build the image:

```bash
docker build -t agentic-ai-chatbot .
```

Run the container:

```bash
docker run -d -p 8080:8080 --env-file .env --name agentic-ai-chatbot agentic-ai-chatbot
```

You can also use Docker Compose:

```bash
docker compose up -d
```

## API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| GET | `/` | Chat interface |
| GET | `/health` | Health check |
| GET | `/conversations` | Get conversations |
| GET | `/history/{thread_id}` | Get conversation history |
| POST | `/upload` | Upload documents |
| POST | `/chat/stream` | Stream chat responses |

## CI/CD and Deployment

I've also worked on automating the Docker deployment process using GitHub Actions.

Whenever changes are pushed to the main branch, the workflow builds a Docker image and pushes it to Docker Hub with appropriate tags.

The application is deployed on Render using the Docker image.

**Live Application:** https://agentic-ai-chatbot-v3sa.onrender.com

A small note about the live demo: Render's free service can sleep after inactivity, and its filesystem is temporary. So uploaded documents, SQLite data and vector storage should not be expected to persist permanently on the hosted version.

## What I Want to Improve Next

There are still plenty of things I'd like to work on:

- Better agent planning and decision-making.
- More advanced multi-agent workflows.
- Improving the RAG pipeline.
- Better memory management.
- User authentication and multi-user support.
- Persistent cloud storage.
- Better evaluation and testing.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.