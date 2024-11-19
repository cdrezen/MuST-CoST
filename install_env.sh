source activate base
conda create --name codegen_3_10 python=3.10
source activate codegen_3_10
conda install pytorch torchvision torchaudio cudatoolkit -c pytorch -c conda-forge
conda install xformers -c xformers/label/dev

pip install -r requirements-notorch.txt

#install fastBPE
git clone https://github.com/glample/fastBPE.git
cd fastBPE
g++ -std=c++11 -pthread -O3 fastBPE/main.cc -IfastBPE -o fast
python setup.py install
cd ..

# tree-sitter
mkdir tree-sitter
cd tree-sitter
git clone https://github.com/tree-sitter/tree-sitter-cpp.git
git clone https://github.com/tree-sitter/tree-sitter-java.git
git clone https://github.com/tree-sitter/tree-sitter-python.git
git clone https://github.com/tree-sitter/tree-sitter-rust.git
git clone https://github.com/tree-sitter/tree-sitter-go.git
cd ..

# cd apex
# # git checkout 810ffae374a2b9cb4b5c5e28eaeca7d7998fca0c
# pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
# cd ..
conda install conda-forge::nvidia-apex

#go get golang.org/x/tools/cmd/goimports
go install golang.org/x/tools/cmd/goimports@latest
