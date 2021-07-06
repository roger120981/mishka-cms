defmodule MishkaHtmlWeb.HomeLive do
  use MishkaHtmlWeb, :live_view

  def mount(_params, session, socket) do
    ### create a simple GenServer or Mnesia to store user id key, token, last_use
    # add acl to another stroge to accsess fast not db
    ### update last use every mount
    ### redirect user to login page
    ### discounect endpoint
    ### clear token and all session
    # create task to delete session after 24 hours if not to be used for 25 minists
    ### if user verify change login menu to logout
    # force logiend user not to see register and reset password
    # create a plug to check user login token and ACL
    # create a handel info def to see user changed like (role and ACL etc, change password)


    socket =
      assign(socket,
        page_title: "تگرگ",
        body_color: "#40485d",
        user_id: Map.get(session, "user_id")
      )
    {:ok, socket}
  end
end
