defmodule MishkaContent.Email.EmailHelper do
  alias MishkaContent.Email.{Email, Mailer}
  # TODO: shluod be in config file or agent on ram
  # TODO: create type space for this file

  def send(type, params) do
    type
    |> create_email_info(params)
    |> Email.account_email()
    |> Mailer.deliver_later!()
  end

  defp create_email_info(:forget_password, {user_email, code_or_link}) do
    %{
      email: "#{user_email}",
      subject: "فراموشی پسورد",
      description: """
      <p dir="rtl" style="text-align: right;">
      از طرف حساب کاربری شما درخواست فراموشی پسورد ارسال گردید است که به شرح زیر می باشد.
       در صورتی که شما ارسال کننده این پیام نبودید لطفا آن را در نظر نگیرید و در صورت تکرار لطفا با پشتیبان وب سایت در تماس باشید.
      </p>
      <p dir="rtl" style="text-align: right;">لینک یا کد تازه سازی پسورد به شرح زیر می باشد:</p>
      <hr>
      #{code_or_link}
      <hr>
      <p> </p>
      <p dir="rtl" style="text-align: right;">
      باید به این نکته توجه داشت. در صورتی که شما از طرف وب سرویس یا اپلکیشن سایت درخواست فراموشی پسورد را کرده اید
      برای شما کد موقت ویرایش پسورد و اگر از طرف سایت این درخواست را کرده باشید لینک ویرایش پسورد. لطفا در صورت نیاز یکی از راه های بالا را
      انتخاب کنید.
      </p>
      <p dir="rtl" style="text-align: right;">کد و لینک موقت ویرایش پسورد دارای یک زمان کوتاه ۵ دقیقه ای می باشد و بعد از آن به صورت خودکار منقضی می گردد.</p>
      <p> </p>
      """,
      short_description: "درخواست فراموشی پسورد",
      main_image_link: "https://trangell.com",
      main_image: "https://online.bobcards.com/assets/images/Loginbanner.svg"
    }
    |> Map.merge(social_info())
    |> Map.merge(site_profile_info())
  end

  defp social_info() do
    %{
      twitter_link: "https://trangell.com",
      twitter_icon: "https://cdn.recast.ai/newsletter/twitter.png",
      facebook_link: "https://trangell.com",
      facebook_icon: "https://cdn.recast.ai/newsletter/facebook.png",
      youtube_link: "https://trangell.com",
      youtube_icon: "https://cdn.recast.ai/newsletter/youtube.png",
    }
  end

  defp site_profile_info() do
    %{
      profile_link: "https://trangell.com",
      profile_image: "https://media-exp1.licdn.com/dms/image/C5603AQFtRFL55RuHJQ/profile-displayphoto-shrink_800_800/0/1624988937475?e=1634169600&v=beta&t=1SehaRFvsduufeURo8xT3wIjDw3s_5fzerOm0-06ZG0",
      profile_name: "Shahryar",
      profile_job_link: "https://trangell.com",
      profile_job_title: "Elixir Developer",
      profile_job_short_description: "Computer programmer at Trangell",
      site_link: "https://trangell.com",
      site_email_logo: "https://trangell.com/images/smal-trangell-logo-354df0f2f90aa2b0d28da7916c607781.png?vsn=d",
    }
  end
end
