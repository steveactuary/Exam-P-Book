# Common Discrete Distributions

## Bernoulli Distribution
The Bernoulli distribution is appropriate when there are two outcomes. Success happens with probability $p$ and failure happens with probability $1-p$.
\begin{equation*} 
    p(x) =
    \left\{
        \begin{array}{cc}
                p & \mathrm{for\ } x=1 \\
                1-p & \mathrm{for\ } x=0 \\
        \end{array} 
    \right.
\end{equation*}

***
```{exercise, bernoulliexr}
Let $X$ be a Bernoulli random variable. Show that $E(X)=p$ and that $V(X)=p \cdot (1-p)$. 
```
***

The number of heads from a single coin flip is an example of a Bernoulli random variable. The event that the coin lands on heads is success, tails is failure. If the coin is fair, $p$ = .5.

## Binomial Distribution
We have an unfair coin that is heads $60\%$ of the time and tails $40\%$ of the time. We flip the coin $5$ times. We express the number of heads as the sum of Bernoulli random variables, $X = H_1 + H_2 + H_3 + H_4 + H_5$ where 
\begin{equation*} 
    H_i =
    \left\{
        \begin{array}{cc}
                1 \text{ if flip } i \text{ is heads} \\
                0 \text{ if flip } i \text{ is tails} \\
        \end{array} 
    \right.
\end{equation*}

We wish to calculate the probability that all $5$ flips are heads. Because coin flips are independent we can use the rule $P(A \cap B) = P(A) \cdot P(B)$ 
\begin{align} 
P(X=5) &= P((H_1=1) \cap (H_2=1) \cap (H_3=1) \cap (H_4=1) \cap (H_5=1)) \notag \\
&=P(H_1=1) \cdot P(H_2=1) \cdot P(H_3=1) \cdot P(H_4=1) \cdot P(H_5=1)  \notag \\
&= .6^5 \notag
\end{align}

Less formally, the only way to achieve all heads is to flip the sequence $HHHHH$. Each head happens with probability $.6$ and the answer is $.6^5$.

What about the probability of flipping exactly $4$ heads? The sequences that can lead to this outcome are:
\begin{align} 
THHHH \notag \\
HTHHH  \notag \\
HHTHH \notag \\
HHHTH \notag \\
HHHHT \notag
\end{align}

These sequences all represent distinct outcomes for $X$. Although some of the sequences are the same in some places, each represents a distinct outcome of $X$, disjoint from all other outcomes. So we can use the addition formula for the probability of disjoint events.
\begin{align} 
&P(X=4) = \notag \\
&P((THHHH) \cup (HTHHH) \cup (HHTHH) \cup (HHHTH) \cup (HHHHT)) = \notag \\
&P(THHHH) + P(HTHHH) + P(HHTHH) + P(HHHTH) + P(HHHHT)=  \notag \\
&5 \cdot .6^4 \cdot .4 \notag
\end{align}

What about the probability of $3$ heads? There are many sequences of flips that result in this, like $HTHTH$. Each of these sequences will have probability $.6^3 \cdot .4^2$ because there are three heads and two tails. To find out how many sequences there are we must answer the question "How many ways are there to assign three of the five coins to be heads?" The answer to this question is:
$${5 \choose 3} = \frac{5!}{3!2!} = 10$$
There are ${5 \choose 3}$ ways to flip $3$ heads and each way has probability $.6^3 \cdot .4^2$, so the probability of three heads is ${5 \choose 3} \cdot .6^3 \cdot .4^2$.

This technique works for the other calculations we have done. There are ${5 \choose 5} = \frac{5!}{5!0!}=1$ ways to flip $5$ heads and ${5 \choose 4} = \frac{5!}{4!1!}=5$ ways to flip $4$ heads.

Let's generalize from our coin flipping. We had $5$ independent Bernoulli trials where each Bernoulli trial had a probability of success as $.6$. What if we had $n$ Bernoulli trials each with a probability of success of $p$. This is called the **binomial distribution** with parameters $n$ and $p$.

***
```{theorem, name="Binomial Distribution"}
Let $X$ have the binomial distribution with parameters $n$ and $p$. We have:
$$p(k) = P(X=k) = {n \choose k}p^k(1-p)^{n-k}$$
```
***

Be sure that this makes perfect sense.

### Mean and Variance of the Binomial Distribution
In exercise \@ref(exr:bernoulliexr) the motivated student showed that if $X$ is Bernoulli with parameter $p$ then $E(X) = p$ and $V(X) = p(1-p)$. These formulas for the binomial distribution are very similar.

***
```{theorem, name="Binomial Distribution"}
Let $X$ have the binomial distribution with parameters $n$ and $p$. We have:
$$E(X) = np$$
$$V(X) = np(1-p)$$
```
***

#### Intuition
Let $X$ be the number of heads from a single coin flip. Let $Y$ be the number of heads from $10$ coin flips.
$$E(X)=np=1 \cdot .5$$
$$E(Y)=np=10 \cdot .5$$

Think about how many heads you expect to get when you flip $10$ coins. It seems like it should be $10$ times the expected number of heads from $1$ coin. Apparently the variance is also $10$ times larger for $10$ times the coins. 

$$V(X)=np(1-p)=1 \cdot .5^2$$
$$V(Y)=np(1-p)=10 \cdot .5^2$$

## Hypergeometric Distribution
***
```{example, name = "Hypergeometric Rocks"}
We have $15$ rocks in a bag. $7$ rocks are red and $8$ are black. We select $5$ rocks. What is the probability of selecting exactly $2$ red rocks and $3$ black rocks.

Any selection of rocks is equally likely. We can use our formula for the probability when all events are equally likely.

$$\frac{\text{Number of Selected Outcomes}}{\text{Total Possible Outcomes}}$$
  
For the denominator we need to find how many ways there are to draw $5$ rocks from a set of $15$. This is $15 \choose 5$.

For the numerator we need to select $2$ red rocks from a set of $7$. This can be done in $7 \choose 2$ ways. We can select $3$ blue rocks from $8$ in $8 \choose 3$ ways. There are then ${7 \choose 2}{8 \choose 3}$ ways to select the rocks.

The answer is then:
$$\large \frac{{7 \choose 2}{8 \choose 3}}{{15 \choose 5}}$$
```

***
***

```{exercise, name="Hypergeometric Cards"}
We have a deck of $40$ cards. $30$ cards are red and $10$ are black. We draw a hand of $5$ cards. Show that the probability of drawing $3$ black cards is:
$$\large{\frac{{30 \choose 2}{10 \choose 3}}{{40 \choose 5}}}$$
```
***

I strongly recommend students know how to figure these things out without consulting any formula sheets. I think trying to memorize this formula would be far worse than using the basics to derive it. Here is the formula.

***

```{definition, name="Hypergeometric Distribution"}
We randomly select $n$ items from a population of $N$ items. Let $r$ represent the number of items from the population classified as a success, and $k$ be the number of items in the selection classified as successes. Let $X$ be the random variable representing the number of items in our selection considered successes. 

$$P(X=k) = \large{\frac{{{N-r}\choose{n-k}}{{r}\choose{k}}}{{N \choose n}}}$$
```

***

```{example, name = "Memorization Is Bad"}
We return to our example with $15$ rocks in a bag. $7$ rocks are red. We select $5$ rocks. What is the probability of selecting exactly $2$ red rocks. We abandon critical thought and use the formula.

$$P(X=k) = \large{\frac{{{N-r}\choose{n-k}}{{r}\choose{k}}}{{N \choose n}}} \\
= \large{\frac{{{15-7}\choose{5-2}}{{7}\choose{2}}}{{15 \choose 7}}}$$
```

I think trying to memorize this formula is a mistake. There are also formulas for the variance and mean that are not discussed here because there is not much understanding to be gained.

### Hypergeometric vs. Binomial
The hypergeometric distribution is closely related to the binomial distribution. We have a group of $600$ actuaries and $400$ astronauts. We select $4$ people randomly from the $1000$ to win a prize, what is probability that $3$ people are actuaries and $1$ is an astronaut?
$$\large \frac{{600 \choose 3}{400 \choose 1}}{{1000 \choose 4}} = 0.3459$$

The hypergeometric distribution is different than the binomial distribution because it samples **without replacement**. Let's change the problem and allow someone to win a prize multiple times. $4$ names are drawn from a hat. Each time a name is drawn a prize is given and the name is put back in the hat (this is sampling **with replacement**). Since $600$ of the $1000$ people are actuaries, any time we make a selection to win a prize there is a probability of $.6$ that the person is an actuary. We select $4$ people, so the distribution of prizes given to actuaries is binomial with parameters $n = 4$, $p = .6$. In this example the probability of $3$ actuaries winning prizes and $1$ astronaut winning a prize is:
$${4 \choose 3} \cdot .6^3 \cdot .4 = .3456$$

The hypergeometric distribution (without replacement) gives $.3459$ and the binomial distribution (with replacement) gives $.3456$. In the hypergeometric distribution if an actuary's name is drawn from the hat, the name does not go back in the hat. The probability that the first name drawn is an actuary is $.6$ just like our example with replacement. Once an actuary's name is drawn from the hat the probability of drawing another actuarial name is $\frac{599}{999} \approx.6$. This is why our hypergeometric and binomial distributions are so similar in this problem. This approximation works best when the overall population is large enough so that selecting without replacement changes the probabilities very little from selecting with replacement.


## Poisson Distribution
A Poisson distribution is appropriate when we are counting the number of times something happens in an hour or some unit of time. How many texts do I get in an hour? How often does someone in the state of California say the word "dude". How often does a person in the city of Minneapolis trip and fall? How often does a car accident happen on interstate 35? These are things that happen at some frequency.

If you ever see the phrase **"the average rate"** you should consider that the question might be related to the Poisson distribution.

Often they give you the rate per hour and you need to convert it to the rate per $2$ hours, or the daily rate, or the rate per minute.
$\lambda$

***

```{example, name = "Poisson Scaling Rate"}
The average rate of people spilling their coffee in the office is $2$ per hour. Generally this rate is called $\lambda$, so $\lambda = 2$. The rate of people spilling coffee per minute is $\frac{\lambda}{60} = \frac{1}{30}$. The rate of people spilling their coffee every day is $24 \lambda = 48$.
```

***

In reality most of the coffee will be spilled in the morning so the time of day changes the rate of spilling. The Poisson model does not work this way though. In the Poisson model it is assumed that the rate is constant throughout the day. The Poisson model also assumes that one person spilling their coffee doesn't make another person spill their coffee, spills are .


***

```{theorem, name="Poisson Distribution"}
Let $X$ have a Poisson distribution with parameter $\lambda$. The probability of $k$ occurences of something happening is:
$$\large P(X=k) = \frac{e^{-\lambda}\lambda^k}{k!}$$
```

***

***

```{example, name = "Poisson Scaling Rate"}
Assume a Poisson model. The average rate of people spilling their coffee in the office throughout the work day is $2.5$ spills per hour. What is the probability that $2$ people spill their coffee between $8$ A.M. and $9$ A.M., and $6$ people spill their coffee between $11$ A.M. and $1$ P.M.?
  
Because the number of spills across time intervals is independent:
$$P(\text{2 spills from 8-9 A.M. and 6 spills from 11 A.M.-1 P.M.}) = \\
P(\text{2 spills from 8-9 A.M.}) \cdot P(\text{6 spills from 11 A.M.-1 P.M.})$$
  
For the calculation from $\text{8-9 A.M.}$ we use $\lambda = 2.5$ since the time interval is $1$ hour. 
$$\large P(\text{2 spills from 8-9}) =\frac{e^{-2.5}2.5^2}{2!}$$
  
For the calculation from $\text{11 A.M.- 1 P.M.}$ we use $\lambda = \lambda_\text{1 hour} \cdot t = 2.5 \cdot 2 =  5$ since the time interval is $2$ hours. 
$$\large P(\text{6 spills from 11 A.M.-1 P.M.}) =\frac{e^{-5}5^6}{6!}$$
  
We multiply these quantities to get the answer:
$$\large \frac{e^{-2.5}2.5^2}{2!} \cdot \frac{e^{-5}5^6}{6!} = .03751$$
```

***

This formula is sort of funny so we try to make some connections to things so it makes sense. People that payed attention in Calculus 2 will know that $e^x = \frac{x^0}{0!} + \frac{x^1}{1!} + \frac{x^2}{2!} + \frac{x^3}{3!} +... = \displaystyle\sum_{n=0}^{\infty} \frac{x^n}{n!}$.

Let's veryify that the sum of all probabilities is $1$ for a Poisson $X$.

$$\displaystyle\sum_{n=0}^{\infty} P(X=k) = \displaystyle\sum_{n=0}^{\infty}\frac{e^{-\lambda}\lambda^k}{k!} =  \\e^{-\lambda} \displaystyle\sum_{n=0}^{\infty} \frac{\lambda^k}{k!} = e^{-\lambda}e^\lambda=1$$
Using the expansion for $e^x$ it can be proven that:

***

```{theorem, name="Poisson Distribution"}
Let $X$ have a Poisson distribution with parameter $\lambda$.
$$E(X) = \lambda$$
$$V(X) = \lambda$$
  
Easy to remember right?
```

***

## Geometric Distribution
Let $X$ be the number of tries it takes to land a backflip if I land $10%$ of my backflips. This is an example of a geometric distribution. The geometric distribution is when you take independent bernoulli trials until the first success. Each backflip attempt is an independent bernoulli trial with the same probability of success (assuming I don't improve or get tired).

The probability of success on my first attempt is $.1$. The probability of success on my second attempt is $.9 \cdot .1$, first you fail, then you succeed. The probability of success on my third attempt is $.9 \cdot .9 \cdot .1$, first I fail twice, then I succeed. Do you see how this goes? There are failures until there is success. We call the probability of success $p$ and the probability of failure is $1-p$ but we often use $q = 1-p$ to make our formulas shorter.

***

```{definition, name="Geometric Distribution"}
We perform independent Bernoulli trials, each having a probability of success $p$ and probability of failure $q$. Let $X$ represent the trial on which the first success occurs. 

$$P(X=k) = q^{k-1}p$$
```

***

***

```{definition, name="Geometric Distribution"}
Let $X$ be a geometric random variable with parameter p.

$$E(X) = \frac{1}{p}$$
$$V(X) = \frac{1-p}{p^2}$$
```

***

There are multiple forms of the geometric distribition. So far we have been counting the attempt on which we succeed. Another way to do this is to count the number of failures before success.

Suppose we land a backflip on our first attempt. $X=1$ if $X$ is the try on which we succeed. If we let $Y$ be the number of failures until success, $Y=0$. We see that there are two ways to do this.

I personally prefer the formulation where we use the try on which we succeed. This is because if I land $p=\frac{1}{10}$ of my backflips then the expected try on which I succeed is $\frac{1}{p}=10$. This makes sense to me and it is pretty. If we use the other formulation where $Y$ is the number of failures before success we can say that $Y=X-1$ and 
$$E(Y) = E(X-1) = E(X)-1= \\ \frac{1}{p}-1 = \frac{1-p}{p}$$
$V(Y)$ is unchanged because $V(Y) = V(X+b) = V(X)$. 
$$V(Y) = \frac{1-p}{p^2}$$

## Negative Binomial Distribution
The geometric distribution has a parameter $p$ and the value of the random variable is the first successful attempt. The negative binomial distribution has two parameters, $p$ and $r$. The negative binomial distribution counts the attempt on which the $rth$ success occurs.

We flip an unfair coin with a probability of $.6$ for heads and $.4$ for tails. Let $X$ be the trial on which we get the $3rd$ head. We wish to know $P(X=5)$. Let's first consider that the $5th$ flip must be a head. Of the first $4$ flips, $2$ of them are heads. We get $2$ heads in the first four flips with probability:
$${4 \choose 2}.6^2.4^2$$
We need the fifth flip to be heads so we multiply this probability by $.6$ to get our answer of:
$${4 \choose 2}.6^3.4^2$$
In this case $P(X=x) = {{x-1} \choose {r-1}}p^r(1-p)^{x-r}$.

### Other (more common) formulation
A more common way of representing this is to count the number of failures until the $rth$ success. 

***

```{definition, name="Negative Binomial Distribution"}
Let $Y$ be the number of failures until the $rth$ success. We calculate the p.d.f. of $Y$.
$$P(Y=y)={{r+y-1} \choose y}p^r(1-p)^y$$
```

***

If $X$ is the R.V. representing the attempt on which the $rth$ success occurs and $Y$ is the R.V. representing the number of failures before the $rth$ success, then $Y = X - r$ because $\text{failures = attempts - successes}$. Regardless of if the question asks you to count failures or attempts, the prepared student should be able to deduce the probability using first principles.

We give formulas for the expectation and variance for this formulation of the negative binomial distribution.

***

```{theorem, name="Negative Binomial Distribution"}
Let $Y$ be the number of failures until the $rth$ success.
$$E(Y) = \frac{r(1-p)}{p}$$
$$V(Y) = \frac{r(1-p)}{p^2}$$
```

***





