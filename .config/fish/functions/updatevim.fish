function updatevim
    set -lx SHELL (which bash)
    vim +BundleInstall! +BundleClean +qall
end

