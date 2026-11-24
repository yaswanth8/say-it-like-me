# Question bank

For Mock, Drill and JD prep. Use the sections that match the profile's skills and target roles (and the job description, when there is one); skip the rest. These are starting points: rephrase them the way a real interviewer would, and add follow-ups based on the candidate's answers. Add new questions under the right heading as the bank grows, or a new heading for a stack that isn't here.

## Everyone
- Tell me about yourself.
- Walk me through your current project and your part in it.
- Why are you looking for a change? Why this company?
- The hardest problem you've solved recently.
- A time you disagreed with your manager or a teammate.
- A time you missed a deadline or made a mistake.
- Something you improved without being asked.
- How you learn a new tool or domain quickly.
- How you work with people outside your team (business, product, support).
- How you use AI tools in your work.
- Where do you see yourself in a few years?
- Questions about notice period, start date, work authorization, relocation, salary.
- What questions do you have for us?

## Programming fundamentals (any language)
- Process vs thread; concurrency vs parallelism.
- What happens when you look up a key in a hash map? Collisions?
- Mutable vs immutable objects; why immutability helps.
- Exceptions / error handling: what you throw, catch and log.
- Memory management and garbage collection at a high level.
- Composition vs inheritance; an example of each from your code.
- SOLID or other design principles you actually apply; a design pattern you've used and why.
- How you write testable code.

## Java and Spring
- equals/hashCode contract; HashMap vs ConcurrentHashMap.
- Streams: map vs flatMap; Optional, when and when not.
- What changed in recent Java versions that you use (records, pattern matching, virtual threads)?
- synchronized vs locks vs atomics; ExecutorService and CompletableFuture.
- Spring Boot auto-configuration; bean scopes; constructor injection.
- @Transactional: propagation, self-invocation, rollback rules.
- Global exception handling in a REST API; validation.
- JPA: N+1, lazy vs eager loading, fixing slow queries.
- Spring Security: filter chain, JWT, OAuth2.

## Python
- List vs tuple vs set vs dict; when each.
- The GIL: when it matters, threading vs multiprocessing vs asyncio.
- Generators and iterators; decorators; context managers.
- Mutable default arguments; shallow vs deep copy.
- Virtual environments and dependency management.
- Django / Flask / FastAPI: request lifecycle, ORM pitfalls, async endpoints.
- Testing with pytest: fixtures, mocking.

## JavaScript, TypeScript and Node
- let / const / var; closures; `this`.
- The event loop: microtasks vs macrotasks; promises vs async/await.
- == vs ===; null vs undefined.
- TypeScript: interface vs type, generics, unknown vs any.
- Node: streams, error handling in async code, scaling with clusters or workers.

## .NET / C#
- Value vs reference types; struct vs class.
- async/await and deadlocks; Task vs ValueTask.
- Dependency injection lifetimes (singleton, scoped, transient).
- LINQ deferred execution; Entity Framework tracking and performance.

## Front end (React, Angular, Vue)
- React: useEffect dependencies and cleanup, keys in lists, useMemo / useCallback, what causes re-renders, state management choices.
- Angular: dependency injection, observables vs promises, switchMap vs mergeMap, OnPush change detection, lazy loading, interceptors.
- Accessibility basics; performance (bundle size, lazy loading, images).
- How you handle loading, errors and empty states for API calls.

## APIs and microservices
- REST design: resources, status codes, versioning, pagination.
- Idempotency for POST requests.
- Sync calls vs messaging between services.
- Timeouts, retries, circuit breakers.
- Distributed transactions: saga, outbox.
- Tracing and correlation IDs; API gateway; service discovery.

## Messaging and caching
- Kafka / RabbitMQ / SQS: ordering, consumer groups, at-least-once delivery and duplicates, dead-letter queues.
- When you'd pick each queue.
- Caching: what to cache, invalidation, cache-aside vs write-through, stampedes and hot keys.

## Databases and SQL
- Second / Nth highest value; latest row per group; rows with no match.
- Joins; GROUP BY with HAVING; window functions.
- Indexes: when they help, when they hurt, composite index order.
- Transactions and isolation levels; optimistic vs pessimistic locking.
- Troubleshooting a slow query; SQL vs NoSQL for a given case.

## Cloud and DevOps
- Which cloud services you've used and for what (AWS, Azure, GCP).
- VMs vs containers vs serverless: how you choose.
- IAM and least privilege; managing secrets.
- High availability across zones; backups and disaster recovery.
- Docker image best practices; Kubernetes deployments, probes, rollouts and rollbacks.
- CI/CD pipeline from commit to production; infrastructure as code (Terraform, CloudFormation, Bicep).
- Monitoring and alerting: what you alert on, an incident you handled.

## Testing and QA
- Unit vs integration vs end-to-end; the test pyramid.
- Mocking: when it helps, when it hides bugs.
- Keeping UI automation (Selenium, Playwright, Cypress) from being flaky.
- Test planning for a new feature; regression strategy; bug reports that get fixed.
- API testing and contract testing; performance testing basics.

## Data engineering and analytics
- Batch vs streaming; ETL vs ELT.
- Data modeling: star schema, slowly changing dimensions.
- Spark / pandas: partitioning, shuffles, memory issues.
- Data quality checks; handling late or duplicate data.
- Picking the right chart; a dashboard that changed a decision.
- A/B tests: sample size, significance, pitfalls.

## Machine learning
- Bias vs variance; overfitting and how you detect it.
- Choosing a metric for an imbalanced problem.
- Feature leakage; train / validation / test splits.
- Deploying and monitoring a model; drift.
- Working with LLMs: prompting, retrieval, evaluation.

## Product, project and business analysis
- How you gather and prioritize requirements.
- Writing user stories and acceptance criteria.
- Saying no to a stakeholder; handling scope creep.
- Measuring whether a feature worked.
- Agile ceremonies that worked or didn't on your team.

## DSA (coding round)
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
- Coin change / climbing stairs (DP basics).

## System design
See `system-design.md` for frequent prompts.
