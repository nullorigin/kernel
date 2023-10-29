DIRS=$(echo $(echo include/*/ && echo */include/*/ && echo */*/include/*/ && echo */*/*/include/*/ && echo */*/*/*/include/*/) | sed -r "s, ,\n,g")
for dir in ${DIRS}; do
    BASENAME=$(basename -a ${dir})
    sed -e 's,<${BASENAME}/.*.h>,"/&/",g' -e 's,"/<${BASENAME}/,\",g' -e 's,.h>/",\.h",g' --in-place $(ls -1 -d "$dir"*)
done;
