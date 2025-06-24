# Kotlin Examples

This module contains Kotlin implementations of Embabel Agent examples, showcasing modern Kotlin features and Spring Boot integration patterns.

## 🚀 Quick Start

### Prerequisites
- Java 21+
- Maven 3.9+
- API Keys: `OPENAI_API_KEY` or `ANTHROPIC_API_KEY`

### Running Examples

```bash
# Interactive Shell Mode (recommended for development)
cd ../scripts/kotlin
./shell.sh        # Unix/Linux/macOS
shell.cmd         # Windows

# Or run directly with Maven
mvn spring-boot:run -Dspring-boot.run.main-class=com.embabel.example.AgentShellApplication
```

## 📂 Project Structure

```
examples-kotlin/
├── src/main/kotlin/com/embabel/example/
│   ├── AgentShellApplication.kt      # Interactive shell with Star Wars logging
│   ├── AgentMcpApplication.kt        # MCP server for Claude Desktop integration
│   ├── horoscope/                    # 🌟 Beginner: Horoscope news finder
│   ├── movie/                        # 🎬 Advanced: Movie recommendation engine
│   └── dogfood/
│       ├── research/                 # 🔬 Expert: Multi-LLM research agent
│       └── factchecker/              # ✅ Expert: Fact-checking agent (DSL)
└── src/main/resources/
    └── application.yml               # Configuration
```

## 🎯 Available Examples

### 1. **Horoscope News Finder** (Beginner)
Find personalized news based on someone's zodiac sign.

**Key Concepts:**
- Basic `@Agent` and `@Action` annotations
- LLM-based data extraction
- Web tool integration
- Goal achievement patterns

**Try it:**
```
shell:> execute "Find horoscope news for Alice who is a Gemini"
```

### 2. **Movie Recommendation Engine** (Advanced) 
Intelligent movie suggestions based on taste profiles and streaming availability.

**Key Concepts:**
- Domain-driven design with rich models
- Spring Data repository integration
- Complex workflows with conditions
- Multiple API integrations (OMDB, streaming services)
- Human-in-the-loop confirmations

**Try it:**
```
shell:> execute "Suggest movies for Rod tonight"
```

### 3. **Multi-LLM Research Agent** (Expert)
Research agent using GPT-4 and Claude with self-critique capabilities.

**Key Concepts:**
- Multi-model consensus building
- Self-improvement loops
- Parallel processing with coroutines
- Configuration-driven behavior
- Quality control mechanisms

**Try it:**
```
shell:> execute "Research the latest developments in quantum computing"
```

### 4. **Fact-Checking Agent** (Expert - DSL)
Fact verification using Embabel's functional DSL approach.

**Key Concepts:**
- Functional agent construction
- Parallel fact verification
- Confidence scoring
- DSL-based workflow definition

**Try it:**
```
shell:> execute "Check facts: The Earth is flat. Water boils at 100°C at sea level."
```

## 🛠️ Configuration

### API Keys
```bash
export OPENAI_API_KEY="your-openai-key"
export ANTHROPIC_API_KEY="your-anthropic-key"

# For Movie Finder
export OMDB_API_KEY="your-omdb-key"
export X_RAPIDAPI_KEY="your-rapidapi-key"
```

### Application Configuration
```yaml
# application.yml
embabel:
  examples:
    moviefinder:
      suggestion-count: 5
    researcher:
      max-word-count: 300
      claude-model-name: "claude-3-haiku-20240307"
      openai-model-name: "gpt-4-turbo-preview"
```

## 🏃 Running Modes

### Interactive Shell (Development)
```kotlin
@SpringBootApplication
@EnableAgentShell
@EnableAgents(loggingTheme = "starwars")
class AgentShellApplication
```

Features:
- Command-line interface
- Star Wars themed logging
- Command history
- Tab completion

### MCP Server (Production/Integration)
```kotlin
@SpringBootApplication
@EnableAgentMcpServer
class AgentMcpApplication
```

Features:
- JSON-RPC server
- Claude Desktop integration
- Tool discovery protocol
- Concurrent request handling

## 💡 Kotlin-Specific Features

### Data Classes for Domain Models
```kotlin
data class MovieBuff(
    override val name: String,
    val movieRatings: List<MovieRating>,
    val tasteProfile: String? = null
) : Person
```

### Coroutines for Async Operations
```kotlin
@Action
suspend fun researchTopic(topic: String): ResearchReport {
    coroutineScope {
        val gpt4 = async { researchWithGpt4(topic) }
        val claude = async { researchWithClaude(topic) }
        mergeReports(gpt4.await(), claude.await())
    }
}
```

### Extension Functions
```kotlin
fun MovieBuff.hasWatched(movie: String): Boolean = 
    movieRatings.any { it.title.equals(movie, ignoreCase = true) }
```

### DSL for Agent Construction
```kotlin
agent("FactChecker") {
    flow {
        transformation<UserInput, FactualAssertions> { 
            extractClaims(it) 
        }
        parallelize()
    }
}
```

## 🧪 Testing

```bash
# Run all tests
mvn test

# Run specific test
mvn test -Dtest=StarNewsFinderTest

# With coverage
mvn test jacoco:report
```

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| `No API key found` | Set `OPENAI_API_KEY` or `ANTHROPIC_API_KEY` |
| `Movie agent fails` | Ensure `OMDB_API_KEY` and `X_RAPIDAPI_KEY` are set |
| `Import errors` | Run `mvn clean install` from project root |
| `Shell doesn't start` | Check if port 8080 is available |

## 📚 Learning Path

1. **Start with Horoscope** - Understand basic agent concepts
2. **Explore Movie Finder** - Learn advanced Spring patterns
3. **Study Researcher** - Master multi-LLM coordination
4. **Try Fact Checker** - Experiment with DSL approach

## 🤝 Contributing

When adding new examples:
1. Follow Kotlin coding conventions
2. Use meaningful variable names (not just `it`)
3. Leverage Kotlin features appropriately
4. Add KDoc documentation
5. Include integration tests

## 📄 License

Licensed under Apache License 2.0. See [LICENSE](../../LICENSE) for details.