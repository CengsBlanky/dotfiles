function kubectl
    if command -q /usr/bin/kubectl
        kubectl $argv
    else if command -q minikube
        minikube kubectl -- $argv
    else
        echo "kubectl not found!"
        return 1
    end
end
