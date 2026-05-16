---
marp: true
theme: gaia
size: 16:9
paginate: true
style: |
  section {
    --bg: #08111f;
    --bg2: #111b33;
    --ink: #f8fafc;
    --muted: #cbd5e1;
    --accent: #7c3aed;
    --accent2: #06b6d4;
    --accent3: #f97316;
    background:
      radial-gradient(circle at top right, rgba(124, 58, 237, 0.40), transparent 32%),
      radial-gradient(circle at bottom left, rgba(6, 182, 212, 0.20), transparent 26%),
      linear-gradient(135deg, var(--bg) 0%, var(--bg2) 100%);
    color: var(--ink);
    font-family: "Segoe UI", "Trebuchet MS", sans-serif;
    padding: 26px 38px 82px 38px;
    letter-spacing: 0.01em;
  }
  section::before {
    content: "";
    position: absolute;
    inset: 22px;
    border-radius: 22px;
    border: 1px solid rgba(255, 255, 255, 0.08);
    pointer-events: none;
  }
  section[data-marpit-pagination]::after {
    right: 20px;
    bottom: 14px;
    left: auto;
    top: auto;
    padding: 0.12em 0.42em;
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.08);
    color: rgba(255, 255, 255, 0.76);
    font-size: 0.58rem;
    line-height: 1;
    z-index: 2;
  }
  h1, h2, h3 {
    color: white;
    margin-top: 0;
  }
  h1 {
    font-size: 2.7rem;
    line-height: 1.02;
    margin-bottom: 0.15em;
  }
  h2 {
    font-size: 1.72rem;
    margin-bottom: 0.25em;
  }
  h3 {
    font-size: 1.08rem;
    margin-bottom: 0.28em;
  }
  p, li, table {
    font-size: 0.94rem;
    line-height: 1.32;
    color: var(--ink);
  }
  strong {
    color: white;
  }
  code {
    background: rgba(255, 255, 255, 0.12);
    color: #f8fafc;
    padding: 0.12em 0.35em;
    border-radius: 6px;
  }
  pre {
    background: rgba(0, 0, 0, 0.28);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 14px;
    padding: 0.8em 0.9em;
    font-size: 0.84rem;
  }
  blockquote {
    border-left: 4px solid var(--accent2);
    background: rgba(255, 255, 255, 0.08);
    padding: 0.45em 0.8em;
    border-radius: 12px;
    margin: 0.35em 0 0.65em;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.88rem;
    background: rgba(255, 255, 255, 0.06);
    border-radius: 14px;
    overflow: hidden;
  }
  th, td {
    padding: 0.42em 0.55em;
    border-bottom: 1px solid rgba(255, 255, 255, 0.12);
  }
  th {
    background: rgba(255, 255, 255, 0.10);
    text-align: left;
  }
  .hero {
    display: grid;
    align-items: center;
    gap: 0.8rem;
  }
  .badge-row {
    display: flex;
    flex-wrap: wrap;
    gap: 0.4rem;
    margin-top: 0.7rem;
  }
  .badge {
    display: inline-block;
    padding: 0.28rem 0.62rem;
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.10);
    border: 1px solid rgba(255, 255, 255, 0.12);
    font-size: 0.74rem;
    color: var(--muted);
  }
  .accent-line {
    height: 3px;
    width: 104px;
    border-radius: 999px;
    background: linear-gradient(90deg, var(--accent2), var(--accent), var(--accent3));
    margin: 0.55rem 0 0.75rem;
  }
  .cards {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 0.6rem;
  }
  .card {
    background: rgba(255, 255, 255, 0.08);
    border: 1px solid rgba(255, 255, 255, 0.10);
    border-radius: 14px;
    padding: 0.68rem 0.82rem;
    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.18);
  }
  .card h3 {
    margin: 0 0 0.2rem;
    font-size: 0.98rem;
  }
  .split {
    display: grid;
    grid-template-columns: 1.08fr 0.92fr;
    gap: 0.75rem;
    align-items: start;
  }
  .split .panel {
    background: rgba(255, 255, 255, 0.07);
    border: 1px solid rgba(255, 255, 255, 0.10);
    border-radius: 16px;
    padding: 0.78rem 0.9rem;
  }
  .split ul {
    margin: 0.25rem 0 0;
  }
  .muted {
    color: var(--muted);
  }
  .timeline {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 0.5rem;
  }
  .step {
    background: rgba(255, 255, 255, 0.08);
    border-radius: 14px;
    padding: 0.62rem 0.72rem;
    border: 1px solid rgba(255, 255, 255, 0.08);
    min-height: 76px;
  }
  .step b {
    color: #fff;
    display: block;
    margin-bottom: 0.25rem;
  }
  .tag {
    color: #08111f;
    background: linear-gradient(90deg, var(--accent2), #a5f3fc);
    font-weight: 700;
    border-radius: 999px;
    padding: 0.12rem 0.48rem;
    display: inline-block;
    font-size: 0.72rem;
  }
  .tight ul, .tight ol {
    margin-top: 0.25rem;
  }
  .tight li {
    margin: 0.16rem 0;
  }
  footer {
    color: rgba(255, 255, 255, 0.62);
    font-size: 0.62rem;
  }
footer: Data Structures & Algorithms | Lecture 1
---

<!-- _class: lead hero -->
# Data Structures and Algorithms

## Lecture 1: Introduction

<div class="accent-line"></div>

**Instructor:** Pradit Pitaksathienkul

<div class="badge-row">
  <span class="badge">ADTs</span>
  <span class="badge">Data Structures</span>
  <span class="badge">Algorithms</span>
  <span class="badge">Time & Space Complexity</span>
</div>

---

## Roadmap

<div class="timeline">
  <div class="step"><b>1. Data Types</b><span class="muted">How Python classifies values</span></div>
  <div class="step"><b>2. ADT</b><span class="muted">The logical blueprint</span></div>
  <div class="step"><b>3. Algorithms</b><span class="muted">Step-by-step problem solving</span></div>
  <div class="step"><b>4. Data Structures</b><span class="muted">Concrete implementations</span></div>
  <div class="step"><b>5. Complexity</b><span class="muted">Time vs. space trade-offs</span></div>
</div>

---

## Data Types

> An **attribute** of data that tells the interpreter how to classify a variable.

<div class="cards tight">
  <div class="card"><h3>Numeric</h3><p class="muted">`int`, `float`, `complex`</p></div>
  <div class="card"><h3>Sequential</h3><p class="muted">`str`, `list`, `tuple`</p></div>
  <div class="card"><h3>Booleans</h3><p class="muted">`True`, `False`</p></div>
  <div class="card"><h3>Dictionary</h3><p class="muted">Key-value mapping with `dict`</p></div>
</div>

---

## ADT vs. Data Structure

<div class="split tight">
  <div class="panel">
    <h3>Abstract Data Type</h3>
    <ul>
      <li>The <strong>what</strong></li>
      <li>Defines allowed operations</li>
      <li>No concrete implementation</li>
      <li>Works as a logical blueprint</li>
    </ul>
  </div>
  <div class="panel">
    <h3>Data Structure</h3>
    <ul>
      <li>The <strong>how</strong></li>
      <li>Stores and organizes data</li>
      <li>Concrete implementation</li>
      <li>Controls performance costs</li>
    </ul>
  </div>
</div>

---

## Example View

<table>
  <thead>
    <tr>
      <th>Aspect</th>
      <th>ADT</th>
      <th>Data Structure</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Role</strong></td>
      <td>Interface</td>
      <td>Implementation</td>
    </tr>
    <tr>
      <td><strong>Stack</strong></td>
      <td>push, pop, peek</td>
      <td>Array-based stack</td>
    </tr>
    <tr>
      <td><strong>Focus</strong></td>
      <td>Rules and operations</td>
      <td>Storage and efficiency</td>
    </tr>
  </tbody>
</table>

---

## Algorithms

> A set of **step-by-step instructions** used to solve a problem.

<div class="split tight">
  <div class="panel">
    <h3>Recipe Analogy</h3>
    <ul>
      <li>Recipe = algorithm</li>
      <li>Steps = instructions</li>
      <li>Meal = output</li>
    </ul>
  </div>
  <div class="panel">
    <h3>Omelet Example</h3>
    <ol>
      <li>Crack eggs into a bowl</li>
      <li>Melt butter over medium-low heat</li>
      <li>Add eggs and cook gently</li>
      <li>Add filling when eggs begin to set</li>
      <li>Fold and serve</li>
    </ol>
  </div>
</div>

---

## Data Structures + Algorithms

<div class="cards tight">
  <div class="card">
    <h3>Data Structures</h3>
    <p class="muted">Store data in a form that supports access and updates.</p>
  </div>
  <div class="card">
    <h3>Algorithms</h3>
    <p class="muted">Process that data to produce results.</p>
  </div>
  <div class="card">
    <h3>Together</h3>
    <p class="muted">They determine correctness, speed, and memory use.</p>
  </div>
  <div class="card">
    <h3>Practical Goal</h3>
    <p class="muted">Pick the right structure before optimizing the code path.</p>
  </div>
</div>

---

## Time & Space Complexity

<div class="split tight">
  <div class="panel">
    <h3>Time Complexity</h3>
    <p class="muted">How long an algorithm takes to run.</p>
    <p><span class="tag">Priority</span> often matters most in production.</p>
  </div>
  <div class="panel">
    <h3>Space Complexity</h3>
    <p class="muted">How much memory an algorithm uses.</p>
    <p><span class="tag">Trade-off</span> sometimes we use more space to save time.</p>
  </div>
</div>

<div class="card" style="margin-top: 0.9rem;">
  <strong>Rule of thumb:</strong> optimize time first unless the environment is tightly memory-constrained.
</div>

---

## Key Takeaways

<div class="cards tight">
  <div class="card"><h3>1. Data Types</h3><p class="muted">Python classifies values into categories.</p></div>
  <div class="card"><h3>2. ADT</h3><p class="muted">Defines the blueprint and allowed operations.</p></div>
  <div class="card"><h3>3. Data Structure</h3><p class="muted">Implements the ADT in a concrete way.</p></div>
  <div class="card"><h3>4. Algorithms</h3><p class="muted">Turn inputs into outputs through steps.</p></div>
</div>

---

<!-- _class: lead hero -->
# Questions?

<div class="accent-line"></div>

**Next:** Python basics and data type operations

---

## References

- Source: [Lecture 1 Introduction](../../raw/Data%20structure/ปี67/Lecture%201%20Introduction/Lecture%201%20Introduction.pdf)
- Related wiki pages:
  - [[python-for-data-structures|Python for Data Structures]]
  - [[linked-list|Linked List]]
  - [[stack|Stack]]
