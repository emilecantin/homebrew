require 'formula'

class Autojump < Formula
  homepage 'https://github.com/joelthelion/autojump#name'
  url 'https://github.com/downloads/joelthelion/autojump/autojump_v21.1.2.tar.gz'
  sha1 '3137d88f52eadecebdbeff12e28586d01c7cf60b'

  head 'https://github.com/joelthelion/autojump.git'

  def install
    inreplace 'bin/autojump.sh', ' /etc/profile.d/', " #{prefix}/etc/"

    bin.install 'bin/autojump'
    man1.install 'docs/autojump.1'
    (prefix+'etc').install 'bin/autojump.sh', 'bin/autojump.bash', 'bin/autojump.zsh'
    (share+'zsh/site-functions').install 'bin/_j'
  end

  def caveats; <<-EOS.undent
    Add the following line to your ~/.bash_profile or ~/.zshrc file (and remember
    to source the file to update your current session):

    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    EOS
  end
end
