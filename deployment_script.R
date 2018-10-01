# deploy.R
#

blogdown::serve_site()


blogdown::new_post()


blogdown::new_content()

# ==============================================================================
# Build Site: Must first delete "public" dir to ensure removal of old files. Then
# build site. Then commit and push.

blogdown::stop_server()

system("rm -fr public")

blogdown::build_site()

system("rm -fr ../friendimaginary.github.io/*")

system("rsync -aP public/ ../friendimaginary.github.io/")

system('git -C ../friendimaginary.github.io add -A')

system('git -C ../friendimaginary.github.io commit -m "site updated from blogdown-source at $(date)."')

system('git -C ../friendimaginary.github.io push')

