# SARSA-Q-learning-and-Expected-SARSA
## SARSA:
For the problem, alpha and epsilon are initialized as 0.5 and 0.1 respectively. Q was created as a
matrix of arrays which can also be called as cell arrays. It has the dimension of 4X12 which is identical to
the grid given in the example. In each location in the Q cell, there is a list which represent the action value
(Q) for each action. The first element in the list represents left, second represents up, third represents
right and the fourth represents down. It is initialized arbitrarily to zeros including the terminal state. When
these actions are taken, a reward of -1 is given. This is done so that the algorithm learns to reach the
terminal state with the least number of moves. There is a cliff at the lower most row and whenever the
object moves into this region, it gets a reward of -100 and is immediately brought back to the start point.
Now the algorithm is looped for each episode and I have set the number of episodes to be 500. The first
state is initialized as [4,1]. From the Q matrix, following e-greedy algorithm, the first action is taken. Now
another loop is started which goes on till the terminal state is reached. The R is stored and based on action,
the next state is evaluated and hence the next action too by following e-greedy algorithm. Now, by using
the update step given for SARSA, the Q value is updated. The old state is now saved as the new state and
the old action as the new action. By using this, the loop proceeds till a terminal state is reached. The Q
values was observed, and it takes the safe path as given in the figure in example. Now each of the rewards
for each time step is summed over to get the reward for the episode and these are stored. In order to
reduce the fluctuations, the rewards are averaged for 20 runs and then a mean is taken so thatthe number
of rewards per episode can be plotted without a lot of fluctuations.

## Q LEARNING
For the Q learning algorithm, the basic algorithm is very similar to SARSA but instead of updating
the action initially and computing the next action and state before updating the Q value and then storing
the computed state and action as the current ones, only the new state is stored and the action has to be
computed for each state. Also, instead of applying e-greedy algorithm, the algorithm always uses a greedy
algorithm and can hence converge to the optimal policy much faster than SARSA because it does not
explore much. Now while the algorithm is converging to the optimal value, the rewards for each episode
is computed and then stored in an array. This is done for 20 such runs and then the values are averaged
over in order to reduce drastic fluctuations. This sum of rewards per episode is plotted against the episode
count.

## Expected SARSA
Expected SARSA is very similar to Q learning and the only difference is that instead of finding the
optimal value that is by going greedy, the sum of probabilities of each action in the state is used. This is
obtained from the policy that has been followed. Since we go for e greedy algorithm usually, pi is taken
as e-greedy too as usual. The greedy option is chosen with a probability of 0.9 and the remaining actions
are chosen with 0.1/3 as the probability. The rewards are calculated for each episode and this is again
done for 20 such runs and then averaged over all these runs. This sum of rewards is plotted against the
episode count.
