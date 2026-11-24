# Question bank

For Mock, Drill and JD prep. Pick from the topics the candidate's profile and the job description share, most likely first. These are starting points: rephrase them the way a real interviewer would, and add follow-ups based on the candidate's answers. Add new questions under the right heading as the bank grows.

## Core Java
- What happens when you put a key in a HashMap? What if two keys have the same hashCode?
- equals and hashCode contract: what breaks if you override only one?
- String vs StringBuilder; why is String immutable?
- Checked vs unchecked exceptions: which do you throw from your own code and why?
- final, finally, finalize.
- How does garbage collection work at a high level? Which collector do your services use?
- Comparable vs Comparator.
- What changed in Java 8, 11, 17 and 21 that you actually use? (records, sealed classes, pattern matching, virtual threads)
- Optional: when do you use it and when not?
- Streams: map vs flatMap; intermediate vs terminal operations; parallel streams, yes or no?

## Collections and concurrency
- ArrayList vs LinkedList; HashMap vs TreeMap vs LinkedHashMap.
- HashMap vs ConcurrentHashMap vs Collections.synchronizedMap.
- synchronized vs ReentrantLock vs atomic classes.
- volatile: what does it guarantee and what doesn't it?
- ExecutorService, thread pools, and how you size them.
- CompletableFuture: chaining calls and handling errors.
- Deadlock: how it happens, how you find it, how you avoid it.
- Virtual threads in Java 21: when would you use them?

## Spring and Spring Boot
- How does Spring Boot auto-configuration work?
- Bean scopes; singleton beans and thread safety.
- Constructor vs field injection.
- @Transactional: propagation, why it doesn't work on a self-invoked method, rollback rules.
- How do you handle exceptions globally in a REST API?
- Profiles and externalized configuration; secrets.
- Actuator, health checks and metrics.
- How would you upgrade a large set of services to a new Spring Boot major version?
- Spring Data JPA: N+1 problem, lazy vs eager, how you fix slow queries.

## Spring Security
- How does the filter chain work?
- JWT authentication flow; where do you validate the token?
- OAuth2 / OpenID Connect: authorization code flow, resource server.
- How do you secure service-to-service calls?
- CORS and CSRF: when does each matter?

## Microservices
- How do you decide service boundaries?
- Synchronous REST vs asynchronous messaging between services.
- Circuit breaker, retry, timeout, bulkhead.
- Distributed transactions: saga, outbox pattern.
- Service discovery and API gateway.
- Distributed tracing and correlation IDs.
- How do you version APIs without breaking consumers?
- Idempotency for POST endpoints.

## Kafka and messaging
- Topic, partition, consumer group, offset: how do they fit together?
- How do you keep ordering? What breaks it?
- At-least-once vs exactly-once; how you handle duplicates.
- What happens when a consumer is slow or a message keeps failing? (retry topic, DLQ)
- Kafka vs RabbitMQ: when would you pick each?
- Consumer rebalancing and its impact.

## Caching (Redis)
- What do you cache, and how do you invalidate it?
- Cache-aside vs write-through.
- TTLs, cache stampede, hot keys.
- Redis as a distributed lock: risks.

## Databases and SQL
- Find the second / Nth highest salary.
- Latest record per customer (window functions).
- Joins: inner vs left; find rows with no match.
- Indexes: when they help, when they hurt, composite index order.
- Isolation levels; optimistic vs pessimistic locking.
- How do you troubleshoot a slow query in production?
- SQL vs NoSQL for a given use case.

## AWS and cloud
- Which AWS services have you used and for what?
- EC2 vs ECS vs EKS vs Lambda: how do you choose?
- SQS vs SNS vs Kafka (MSK).
- IAM roles vs users; least privilege for a service.
- How do you manage secrets? (Secrets Manager, Parameter Store)
- S3 for large file uploads (pre-signed URLs).
- High availability across AZs; RDS read replicas and failover.
- Infrastructure as code: Terraform or CloudFormation in your projects.

## Containers, Kubernetes, CI/CD
- Dockerfile best practices for a Spring Boot app.
- Kubernetes: Deployment, Service, ConfigMap, Secret; liveness vs readiness probes.
- How do you roll out without downtime? Rollback?
- Helm: what problem does it solve?
- Your CI/CD pipeline from commit to production.

## Testing
- Unit vs integration vs contract tests: what do you write for a new endpoint?
- Mockito: mocking vs spying; when not to mock.
- Testcontainers.
- End-to-end UI tests (Playwright / Selenium): how you keep them from being flaky.

## React
- useEffect: dependency array, cleanup, common bugs.
- State management: local state vs context vs Redux.
- Why do lists need keys?
- useMemo / useCallback: when are they worth it?
- How do you handle API calls, loading and errors?
- Rendering performance: what causes re-renders?

## Angular
- Components, services, dependency injection.
- Observables vs promises; switchMap vs mergeMap.
- Change detection; OnPush.
- Lazy loading modules / routes.
- Reactive forms vs template-driven forms.
- Interceptors for auth tokens and errors.

## JavaScript / TypeScript
- let / const / var; closures; this.
- Event loop: microtasks vs macrotasks.
- == vs ===; null vs undefined.
- TypeScript: interface vs type; generics; unknown vs any.

## DSA (coding round, Java)
- Two sum; three sum.
- Valid parentheses.
- Longest substring without repeating characters (sliding window).
- Merge intervals.
- Reverse a linked list; detect a cycle.
- Binary search variants (rotated array, first/last position).
- Top K frequent elements (heap).
- Level-order traversal; validate a BST; lowest common ancestor.
- Number of islands (BFS/DFS).
- LRU cache.
- Group anagrams.
- Kth largest element.
- Climbing stairs / coin change (DP basics).

## System design
See `system-design.md` for the list of frequent prompts.

## Behavioral and HR
- Tell me about yourself.
- Walk me through your current project's architecture.
- Hardest bug or production incident you handled.
- A time you disagreed with your lead or a teammate.
- A time you missed a deadline or made a mistake.
- Something you improved without being asked.
- How you mentor or onboard others.
- How you use AI coding tools (Copilot, Claude) in your work.
- Why are you looking for a change? Why this company?
- Notice period, start date, work authorization, relocation, salary expectations.
