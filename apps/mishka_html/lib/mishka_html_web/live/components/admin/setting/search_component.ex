defmodule MishkaHtmlWeb.Admin.Setting.SearchComponent do
  use MishkaHtmlWeb, :live_component


  def render(assigns) do
    ~L"""
      <div class="clearfix"></div>
      <div class="col space30"> </div>
      <hr>
      <div class="clearfix"></div>
      <div class="col space30"> </div>
      <h2 class="vazir">
      <%= MishkaTranslator.Gettext.dgettext("html_live_component", "جستجوی پیشرفته") %>
      </h2>
      <div class="clearfix"></div>
      <div class="col space30"> </div>
      <div class="col space10"> </div>

      <form  phx-change="search">
        <div class="row vazir admin-list-search-form">


              <div class="col-sm-4">
                <label for="country" class="form-label"><%= MishkaTranslator.Gettext.dgettext("html_live_component", "بخش") %></label>
                <div class="space10"> </div>
                <input type="text" class="title-input-text form-control" name="section" id="SectionName">
                <div class="col space10"> </div>
              </div>


              <div class="col-sm-2">
                  <label for="country" class="form-label vazir"><%= MishkaTranslator.Gettext.dgettext("html_live_component", "عملیات سریع") %></label>
                  <div class="col space10"> </div>
                  <button type="button" class="vazir col-sm-8 btn btn-primary reset-admin-search-btn" phx-click="reset"><%= MishkaTranslator.Gettext.dgettext("html_live_component", "ریست") %></button>
              </div>
        </div>
      </form>
    """
  end

  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
