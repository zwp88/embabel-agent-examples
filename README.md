![Build](https://github.com/embabel/embabel-agent/actions/workflows/maven.yml/badge.svg)

[//]: # ([![Quality Gate Status]&#40;https://sonarcloud.io/api/project_badges/measure?project=embabel_embabel-agent&metric=alert_status&token=d275d89d09961c114b8317a4796f84faf509691c&#41;]&#40;https://sonarcloud.io/summary/new_code?id=embabel_embabel-agent&#41;)

[//]: # ([![Bugs]&#40;https://sonarcloud.io/api/project_badges/measure?project=embabel_embabel-agent&metric=bugs&#41;]&#40;https://sonarcloud.io/summary/new_code?id=embabel_embabel-agent&#41;)

![Kotlin](https://img.shields.io/badge/kotlin-%237F52FF.svg?style=for-the-badge&logo=kotlin&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)
![Apache Maven](https://img.shields.io/badge/Apache%20Maven-C71A36?style=for-the-badge&logo=Apache%20Maven&logoColor=white)
![ChatGPT](https://img.shields.io/badge/chatGPT-74aa9c?style=for-the-badge&logo=openai&logoColor=white)
![Jinja](https://img.shields.io/badge/jinja-white.svg?style=for-the-badge&logo=jinja&logoColor=black)
![JSON](https://img.shields.io/badge/JSON-000?logo=json&logoColor=fff)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![SonarQube](https://img.shields.io/badge/SonarQube-black?style=for-the-badge&logo=sonarqube&logoColor=4E9BCD)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![IntelliJ IDEA](https://img.shields.io/badge/IntelliJIDEA-000000.svg?style=for-the-badge&logo=intellij-idea&logoColor=white)

<img align="left" src="https://github.com/embabel/embabel-agent/blob/main/embabel-agent-api/images/315px-Meister_der_Weltenchronik_001.jpg?raw=true" width="180">

&nbsp;&nbsp;&nbsp;&nbsp;

&nbsp;&nbsp;&nbsp;&nbsp;
# 🤖 Embabel Agent Examples

Learn agentic AI development with **Spring Framework** and **Kotlin/Java**. These examples demonstrate building intelligent agents that can plan, execute workflows, use tools, and interact with humans.

## 🚀 Quick Start

### Prerequisites
- **Java 21+**
- **Maven 3.9+** 
- **API Key** (at least one): [OpenAI](https://platform.openai.com/api-keys) or [Anthropic](https://www.anthropic.com/api)

### 1. Clone & Build
```bash
git clone <repository-url>
cd embabel-agent-examples
mvn clean install
```

### 2. Set API Keys
```bash
# Required (choose one or both)
export OPENAI_API_KEY="your_openai_key"
export ANTHROPIC_API_KEY="your_anthropic_key"

# Optional (for MovieFinder example)
export OMDB_API_KEY="your_omdb_key"           # http://www.omdbapi.com/
export X_RAPIDAPI_KEY="your_rapidapi_key"     # https://rapidapi.com/
```

### 3. Run Examples

#### **Kotlin Examples** (Recommended)
```bash
cd scripts/kotlin
./shell.sh          # Unix/Linux/macOS
shell.cmd            # Windows
```

#### **Java Examples**
```bash
cd scripts/java
./shell.sh          # Unix/Linux/macOS  
shell.cmd            # Windows
```

---

## 📚 Examples by Learning Level

### 🌟 **Beginner: Horoscope News Agent**
> **Available in:** Java & Kotlin | **Concept:** Basic Agent Workflow

A fun introduction to agent development that finds personalized news based on someone's star sign.

**What It Teaches:**
- 📋 **Action-based workflows** with `@Action` annotations
- 🔍 **Data extraction** from user input using LLMs
- 🌐 **Web tool integration** for finding news stories
- 📝 **Content generation** with personality and context
- 🎯 **Goal achievement** with `@AchievesGoal`

**How It Works:**
1. Extract person's name from user input
2. Get their star sign (via form if needed)
3. Retrieve daily horoscope
4. Search web for relevant news stories
5. Create amusing writeup combining horoscope + news

**Try It:**
```bash
# Start the agent shell, then type:
"Find horoscope news for Alice who is a Gemini"
```

**Code Comparison:**
- **Kotlin:** `examples-kotlin/src/main/kotlin/com/embabel/example/horoscope/StarNewsFinder.kt`
- **Java:** `examples-java/src/main/java/com/embabel/example/horoscope/StarNewsFinder.java`

**Key Patterns:**
```kotlin
@Agent(description = "Find news based on a person's star sign")
class StarNewsFinder {
    
    @Action
    fun extractPerson(userInput: UserInput): Person?
    
    @Action(toolGroups = [CoreToolGroups.WEB])
    fun findNewsStories(person: StarPerson, horoscope: Horoscope): RelevantNewsStories
    
    @AchievesGoal(description = "Create an amusing writeup")
    @Action
    fun starNewsWriteup(/* params */): Writeup
}
```

---

### 🎬 **Advanced: Movie Recommendation Engine**
> **Available in:** Kotlin | **Concept:** Complex Domain-Driven Workflows

An intelligent movie recommendation agent that analyzes taste profiles and suggests streaming-available movies.

**What It Teaches:**
- 🏗️ **Domain-Driven Design** with rich domain models
- 🔄 **Complex workflows** with conditions and retries
- 📊 **Spring Data integration** with repositories
- 🎭 **Persona-based prompting** for creative content
- 🛠️ **Multiple API integration** (OMDB, streaming services)
- 📈 **Progress tracking** and event publishing
- 🤝 **Human-in-the-loop** confirmations

**Domain Model:**
```kotlin
data class MovieBuff(
    override val name: String,
    val movieRatings: List<MovieRating>,
    val countryCode: String,
    val streamingServices: List<String>
) : Person

data class DecoratedMovieBuff(
    val movieBuff: MovieBuff,
    val tasteProfile: String  // AI-generated analysis
)
```

**How It Works:**
1. Find MovieBuff from repository (with confirmation)
2. Analyze their taste profile using AI
3. Research current news for inspiration
4. Generate movie suggestions (excluding seen movies)
5. Filter by streaming availability
6. Create Roger Ebert-style writeup

**Try It:**
```bash
# Requires OMDB_API_KEY and X_RAPIDAPI_KEY
"Suggest movies for Rod tonight"
```

**Key Spring Patterns:**
```kotlin
@ConfigurationProperties(prefix = "embabel.examples.moviefinder")
data class MovieFinderConfig(
    val suggestionCount: Int = 5,
    val suggesterPersona: Persona = Roger,
    val model: String = OpenAiModels.GPT_41_MINI
)

interface MovieBuffRepository : CrudRepository<MovieBuff, String>
```

**Advanced Workflow Control:**
```kotlin
@Action(
    post = [HAVE_ENOUGH_MOVIES],  // Condition check
    canRerun = true               // Retry if needed
)
fun suggestMovies(/* params */): StreamableMovies

@Condition(name = HAVE_ENOUGH_MOVIES)
fun haveEnoughMovies(context: OperationContext): Boolean
```

**Location:** `examples-kotlin/src/main/kotlin/com/embabel/example/movie/`

---

### 🔬 **Expert: Multi-LLM Research Agent**
> **Available in:** Kotlin | **Concept:** Self-Improving AI Workflows

A sophisticated research agent using multiple AI models with self-critique capabilities.

**What It Teaches:**
- 🧠 **Multi-model consensus** (GPT-4 + Claude working together)
- 🔍 **Self-improvement loops** with critique and retry
- ⚙️ **Configuration-driven behavior** with Spring Boot properties
- 🌊 **Parallel processing** of research tasks
- 📝 **Quality control** through automated review

**Architecture:**
```kotlin
@ConfigurationProperties(prefix = "embabel.examples.researcher")
data class ResearcherProperties(
    val maxWordCount: Int = 300,
    val claudeModelName: String = AnthropicModels.CLAUDE_35_HAIKU,
    val openAiModelName: String = OpenAiModels.GPT_41_MINI
)
```

**Self-Improvement Pattern:**
```kotlin
@Action(outputBinding = "gpt4Report")
fun researchWithGpt4(/* params */): SingleLlmReport

@Action(outputBinding = "claudeReport") 
fun researchWithClaude(/* params */): SingleLlmReport

@Action(outputBinding = "mergedReport")
fun mergeReports(gpt4: SingleLlmReport, claude: SingleLlmReport): ResearchReport

@Action
fun critiqueReport(report: ResearchReport): Critique

@AchievesGoal(description = "Completes research with quality assurance")
fun acceptReport(report: ResearchReport, critique: Critique): ResearchReport
```

**Try It:**
```bash
"Research the latest developments in renewable energy adoption"
```

**Location:** `examples-kotlin/src/main/kotlin/com/embabel/example/dogfood/research/`

---

### ✅ **Expert: Fact-Checking Agent (DSL Style)**
> **Available in:** Kotlin | **Concept:** Functional Agent Construction

A fact-verification agent built using Embabel's functional DSL approach instead of annotations.

**What It Teaches:**
- 🔧 **Functional DSL construction** for agents
- 🔍 **Parallel fact verification** across multiple claims
- 📊 **Confidence scoring** and source trust evaluation
- 🌐 **Web research integration** for verification
- ⚡ **Functional programming patterns** in agent design

**DSL Construction:**
```kotlin
fun factCheckerAgent(llms: List<LlmOptions>, properties: FactCheckerProperties) = 
agent(name = "FactChecker", description = "Check content for factual accuracy") {
    
    flow {
        aggregate<UserInput, FactualAssertions, RationalizedFactualAssertions>(
            transforms = llms.map { llm ->
                { context -> /* extract assertions with this LLM */ }
            },
            merge = { list, context -> /* rationalize overlapping claims */ }
        ).parallelize()
    }
    
    transformation<RationalizedFactualAssertions, FactCheck> { 
        /* parallel fact-checking */
    }
}
```

**Domain Model:**
```kotlin
data class FactualAssertion(
    val claim: String,
    val reasoning: String
)

data class AssertionCheck(
    val assertion: FactualAssertion,
    val isFactual: Boolean,
    val confidence: Double,
    val sources: List<String>
)
```

**Try It:**
```bash
"Check these facts: The Earth is flat. Paris is the capital of France."
```

**Location:** `examples-kotlin/src/main/kotlin/com/embabel/example/dogfood/factchecker/`

---

## 🛠️ Core Concepts You'll Learn

### **Spring Framework Integration**
- **Dependency Injection:** Constructor-based injection with agents as Spring beans
- **Configuration Properties:** Type-safe configuration with `@ConfigurationProperties`
- **Conditional Beans:** Environment-specific components with `@ConditionalOnBean`
- **Repository Pattern:** Spring Data integration for domain entities
- **Profile Management:** Environment-specific behavior activation

### **Modern Kotlin Features**
- **Data Classes:** Rich domain models with computed properties
- **Type Aliases:** Domain-specific types (`typealias OneThroughTen = Int`)
- **Extension Functions:** Enhanced functionality for existing types
- **Delegation:** Clean composition patterns
- **DSL Construction:** Functional agent building
- **Coroutines:** Parallel execution with structured concurrency

### **Agent Design Patterns**
- **Workflow Orchestration:** Multi-step processes with `@Action` chains
- **Blackboard Pattern:** Shared workspace for data between actions
- **Human-in-the-Loop:** User confirmations and form submissions
- **Self-Improvement:** Critique and retry loops for quality
- **Multi-Model Consensus:** Combining results from different LLMs
- **Condition-Based Flow:** Workflow control with `@Condition`
- **Progress Tracking:** Event publishing for monitoring

---

## 🔧 Running Specific Examples

### **Interactive Shell Mode** (Default)
```bash
cd scripts/kotlin && ./shell.sh
# or
cd scripts/java && ./shell.sh
```

### **Programmatic Execution**
```bash
# Kotlin examples
cd examples-kotlin
export SPRING_PROFILES_ACTIVE=shell,starwars,docker-desktop
mvn spring-boot:run

# Java examples  
cd examples-java
export SPRING_PROFILES_ACTIVE=shell,starwars,docker-desktop
mvn spring-boot:run
```

### **Testing**
```bash
# Run all tests
mvn test

# Module-specific tests
cd examples-kotlin && mvn test
cd examples-java && mvn test
```

---

## 🎯 Getting Started Recommendations

### **New to Agents?**
1. Start with **Horoscope News Agent** (Java or Kotlin)
2. Compare the Java vs Kotlin implementations
3. Experiment with different prompts and see how the agent plans different workflows

### **Spring Developer?**
1. Examine the **Movie Finder** for advanced Spring patterns
2. Look at the configuration classes and repository integration
3. Study the domain model design and service composition

### **Kotlin Enthusiast?**
1. Start with **Movie Finder** for advanced Kotlin features
2. Progress to **Researcher** for multi-model patterns
3. Explore **Fact Checker** for functional DSL approaches

### **AI/ML Developer?**
1. Study prompt engineering techniques in any example
2. Examine the **Researcher** for multi-model consensus patterns
3. Look at **Fact Checker** for confidence scoring and source evaluation

---

## 🚨 Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| **"No API keys found"** | Set `OPENAI_API_KEY` or `ANTHROPIC_API_KEY` |
| **Movie agent fails** | Set `OMDB_API_KEY` and `X_RAPIDAPI_KEY` |
| **Wrong examples load** | Use correct script: `kotlin/shell.sh` vs `java/shell.sh` |
| **Build failures** | Run `mvn clean install` from project root |
| **Tests fail** | Check API keys are set in test environment |

---

## 📁 Project Structure

```
embabel-agent-examples/
├── examples-kotlin/                 # 🏆 Kotlin implementations
│   └── src/main/kotlin/com/embabel/example/
│       ├── horoscope/              # 🌟 Beginner: Star news agent
│       ├── movie/                  # 🎬 Advanced: Movie recommender  
│       └── dogfood/
│           ├── research/           # 🔬 Expert: Multi-LLM researcher
│           └── factchecker/        # ✅ Expert: Fact checker (DSL)
│
├── examples-java/                   # ☕ Java implementations  
│   └── src/main/java/com/embabel/example/
│       └── horoscope/              # 🌟 Beginner: Star news agent
│
├── examples-common/                 # 🔧 Shared services & utilities
├── scripts/                        # 🚀 Quick-start scripts
│   ├── kotlin/shell.sh             # Launch Kotlin examples
│   └── java/shell.sh               # Launch Java examples
└── pom.xml                         # Maven configuration
```

---

## 📄 License

Licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.

**🎉 Happy coding with Spring Framework and agentic AI!**
