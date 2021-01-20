function [net, state] = DeviceMove(net, state, loc)

if(strcmp(loc, 'cpu'))
    net.move('cpu');
    for i = 1:numel(state.solverState)                            %%% transfer the state to cpu data
        s = state.solverState{i} ;
        if isnumeric(s)
            state.solverState{i} = gather(s) ;
        elseif isstruct(s)
            state.solverState{i} = structfun(@gather, s, 'UniformOutput', false) ;
        end
    end
elseif(strcmp(loc, 'gpu'))
    net.move('gpu');
    for i = 1:numel(state.solverState)
        s = state.solverState{i} ;
        if isnumeric(s)
            state.solverState{i} = gpuArray(s) ;
        elseif isstruct(s)
            state.solverState{i} = structfun(@gpuArray, s, 'UniformOutput', false) ;
        end
    end
else
    disp('======ERROR======');
end

end

