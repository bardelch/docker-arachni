docker images | grep -v ID | awk '{print }' | xargs docker rmi 
