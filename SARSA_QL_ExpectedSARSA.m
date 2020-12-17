alpha = 0.5;
epsilon = 0.1;
for i=1:4
    Q(i,:) = {{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]}};
end
episode_count = 1;
sum_reward_sarsa = [];
run = 1;
sum_reward_run = [];
sum_reward = [];
while run<=20
    episode_count = 1;
    while episode_count<=500
        State = [4,1];
        if(epsilon<=rand())
            max_value = max(Q{State(1),State(2)}{1});
            ind = find(Q{State(1),State(2)}{1}==max_value);
            action = ind(randi(length(ind)));
        else
            action = randi(4);
        end
        next_state = State;
        sum_R = 0;
        while ~(next_state(1)==4&&next_state(2)==12)
            R=-1;
            if(action == 1) %left
                next_state = [State(1),State(2)-1];
            elseif(action==2) %up
                next_state = [State(1)-1,State(2)];
            elseif(action==3) %right
                next_state = [State(1),State(2)+1];
            elseif(action==4) %down
                next_state = [State(1)+1,State(2)];
            end
            if(next_state(2)<1)
                next_state(2) = State(2);
            end
            if next_state(2)>12
                next_state(2) = State(2);
            end
            if next_state(1)>4
                next_state(1) = State(1);
            end
            if next_state(1)<1
                next_state(1) = State(1);
            end
            if(next_state(1)==4&&(ismember(next_state(2),[2:11])))
                R=-100;
                next_state(1)=4;
                next_state(2)=1;
            end
            sum_R = sum_R + R;
            if(epsilon<=rand())
                max_value = max(Q{next_state(1),next_state(2)}{1});
                ind = find(Q{next_state(1),next_state(2)}{1}==max_value);
                next_action = ind(randi(length(ind)));
            else
                next_action = randi(4);
            end
            Q{State(1),State(2)}{1}(action)= Q{State(1),State(2)}{1}(action) + alpha*(R + Q{next_state(1),next_state(2)}{1}(next_action) - Q{State(1),State(2)}{1}(action));
            State = next_state;
            action = next_action;
        end
        sum_reward = [sum_reward, sum_R];
        episode_count = episode_count+1;
    end
    sum_reward_run = [sum_reward_run,sum_reward];
    sum_reward = [];
    run = run+1;
end
for i=1:500
    sum_reward_run(i) = (sum_reward_run(i)+sum_reward_run(i+500)+sum_reward_run(i+1000)+sum_reward_run(i+1500)+sum_reward_run(i+2000)+sum_reward_run(i+2500)+sum_reward_run(i+3000)+sum_reward_run(i+3500)+sum_reward_run(i+4000)++sum_reward_run(i+4500)+sum_reward_run(i+5000)+sum_reward_run(i+5500)+sum_reward_run(i+6000)+sum_reward_run(i+6500)+sum_reward_run(i+7000)+sum_reward_run(i+7500)+sum_reward_run(i+8000)+sum_reward_run(i+8500)+sum_reward_run(i+9000)+sum_reward_run(i+9500))/20;
end
for i = 1:10
    sum_reward_sarsa(i) = sum_reward_run(i);
end
for i = 11:500
    sum_reward_sarsa(i) = mean(sum_reward_run(i-10:i));
end
plot([1:500], sum_reward_sarsa);
legend('SARSA');
hold on;


%Q learning
run = 1;
sum_reward_run = [];
sum_reward = [];
for i=1:4
    Q2(i,:) = {{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]}};
end
episode_count = 1;
sum_reward_Q = [];
while run<=20
    episode_count = 1;
    while episode_count<=500
        State = [4,1];
        next_state = State;
        sum_R = 0;
        while ~(next_state(1)==4&&next_state(2)==12)
            action = 0;
            if(epsilon<=rand())
                max_value = max(Q2{State(1),State(2)}{1});
                ind = find(Q2{State(1),State(2)}{1}==max_value);
                action = ind(randi(length(ind)));
            else
                action = randi(4);
            end
            R=-1;
            if(action == 1) %left
                next_state = [State(1),State(2)-1];
            elseif(action==2) %up
                next_state = [State(1)-1,State(2)];
            elseif(action==3) %right
                next_state = [State(1),State(2)+1];
            elseif(action==4) %down
                next_state = [State(1)+1,State(2)];
            end
            if(next_state(2)<1)
                next_state(2) = State(2);
            end
            if next_state(2)>12
                next_state(2) = State(2);
            end
            if next_state(1)>4
                next_state(1) = State(1);
            end
            if next_state(1)<1
                next_state(1) = State(1);
            end
            if(next_state(1)==4&&(ismember(next_state(2),[2:11])))
                R=-100;
                next_state(1)=4;
                next_state(2)=1;
            end
            sum_R = sum_R + R;
            max_value = max(Q2{next_state(1),next_state(2)}{1});
            ind = find(Q2{next_state(1),next_state(2)}{1}==max_value);
            next_action = ind(randi(length(ind)));
            Q2{State(1),State(2)}{1}(action)= Q2{State(1),State(2)}{1}(action) + alpha*(R + Q2{next_state(1),next_state(2)}{1}(next_action) - Q2{State(1),State(2)}{1}(action));
            State = next_state;
        end
        sum_reward = [sum_reward, sum_R];
        episode_count = episode_count+1;
    end
    sum_reward_run = [sum_reward_run,sum_reward];
    sum_reward = [];
    run = run+1;
end
for i=1:500
    sum_reward_run(i) = (sum_reward_run(i)+sum_reward_run(i+500)+sum_reward_run(i+1000)+sum_reward_run(i+1500)+sum_reward_run(i+2000)+sum_reward_run(i+2500)+sum_reward_run(i+3000)+sum_reward_run(i+3500)+sum_reward_run(i+4000)++sum_reward_run(i+4500)+sum_reward_run(i+5000)+sum_reward_run(i+5500)+sum_reward_run(i+6000)+sum_reward_run(i+6500)+sum_reward_run(i+7000)+sum_reward_run(i+7500)+sum_reward_run(i+8000)+sum_reward_run(i+8500)+sum_reward_run(i+9000)+sum_reward_run(i+9500))/20;
end
for i = 1:10
    sum_reward_Q(i) = sum_reward_run(i);
end
for i = 11:500
    sum_reward_Q(i) = mean(sum_reward_run(i-10:i));
end
plot([1:500],sum_reward_Q);
hold on;


%expected SARSA
run = 1;
sum_reward_run = [];
sum_reward = [];
for i=1:4
    Q3(i,:) = {{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]}};
end
episode_count = 1;
sum_reward_ES = [];
while run<=20
    episode_count = 1;
    while episode_count<=500
        State = [4,1];
        next_state = State;
        sum_R = 0;
        while ~(next_state(1)==4&&next_state(2)==12)
            action = 0;
            if(epsilon<=rand())
                max_value = max(Q3{State(1),State(2)}{1});
                ind = find(Q3{State(1),State(2)}{1}==max_value);
                action = ind(randi(length(ind)));
            else
                action = randi(4);
            end
            R=-1;
            if(action == 1) %left
                next_state = [State(1),State(2)-1];
            elseif(action==2) %up
                next_state = [State(1)-1,State(2)];
            elseif(action==3) %right
                next_state = [State(1),State(2)+1];
            elseif(action==4) %down
                next_state = [State(1)+1,State(2)];
            end
            if(next_state(2)<1)
                next_state(2) = State(2);
            end
            if next_state(2)>12
                next_state(2) = State(2);
            end
            if next_state(1)>4
                next_state(1) = State(1);
            end
            if next_state(1)<1
                next_state(1) = State(1);
            end
            if(next_state(1)==4&&(ismember(next_state(2),[2:11])))
                R=-100;
                next_state(1)=4;
                next_state(2)=1;
            end
            sum_R = sum_R + R;
            max_value = max(Q3{next_state(1),next_state(2)}{1});
            ind = find(Q3{next_state(1),next_state(2)}{1}==max_value);
            next_action = ind(randi(length(ind)));
            pi = [0.0,0.0,0.0,0.0];
            for i = 1:length(pi)
                if(i~=next_action)
                    pi(i) = 0.1/3.0;
                else
                    pi(i) = 0.9;
                end
            end
            x = pi.*Q3{next_state(1),next_state(2)}{1};
            Q3{State(1),State(2)}{1}(action)= Q3{State(1),State(2)}{1}(action) + alpha*(R +x(1) + x(2) + x(3) + x(4) - Q3{State(1),State(2)}{1}(action));
            State = next_state;
        end
        sum_reward = [sum_reward, sum_R];
        episode_count = episode_count+1;
    end
    sum_reward_run = [sum_reward_run,sum_reward];
    sum_reward = [];
    run = run+1;
end
for i=1:500
    sum_reward_run(i) = (sum_reward_run(i)+sum_reward_run(i+500)+sum_reward_run(i+1000)+sum_reward_run(i+1500)+sum_reward_run(i+2000)+sum_reward_run(i+2500)+sum_reward_run(i+3000)+sum_reward_run(i+3500)+sum_reward_run(i+4000)++sum_reward_run(i+4500)+sum_reward_run(i+5000)+sum_reward_run(i+5500)+sum_reward_run(i+6000)+sum_reward_run(i+6500)+sum_reward_run(i+7000)+sum_reward_run(i+7500)+sum_reward_run(i+8000)+sum_reward_run(i+8500)+sum_reward_run(i+9000)+sum_reward_run(i+9500))/20;
end
for i = 1:10
    sum_reward_ES(i) = sum_reward_run(i);
end
for i = 11:500
    sum_reward_ES(i) = mean(sum_reward_run(i-10:i));
end
plot([1:500],sum_reward_ES);
legend('SARSA','Q LEarning','Expected SARSA');