namespace :create_products do
  desc "create products"
  task create: :environment do
    data = [
      {id: 1, title: "곰인형", description: "예쁘고 귀여운 곰인형입니다", price: 23800, image_url: "http://gloomy.co.kr/web/product/big/201901/3ff3b5faa01076695ba742846b8f26c1.jpg"},
      {id: 2, title: "소드실드", description: "닌텐도 스위츠 소드실드 게임칩", price: 45000, image_url: "http://th4.tmon.kr/thumbs/image/0b6/00f/cdf/193721bbd_700x700_95_FIT.jpg"},
      {id: 3, title: "에어팟 프로", description: "에어팟 프로 2021년 1월 제조", price: 240000, image_url: "http://th2.tmon.kr/thumbs/image/279/bd2/a47/65d7a6d9a_700x700_95_FIT.jpg"},
      {id: 4, title: "디즈니 에어팟 프로 케이스", description: "토이스토리 빅헤드 케이스", price: 22900, image_url: "https://image.msscdn.net/images/goods_img/20200209/1297303/1297303_1_500.jpg"},
      {id: 5, title: "국내산 고랭지 배추 5포기", description: "대관령 배추", price: 17800, image_url: "https://www.shinsegaegroupinside.com/wp-content/uploads/2019/12/%EC%9D%B4%EB%A7%88%ED%8A%B8-%EB%B0%B0%EC%B6%94-%EC%9D%B4%EB%AF%B8%EC%A7%80%EC%BB%B7.jpg"},
      {id: 6, title: "메신저백", description: "비엘 메신저백", price: 78000, image_url: "http://gdimg.gmarket.co.kr/1503106743/still/600?ver=1539238907"},
    ];

    data.each do |d|
      p = Product.new(d)
      p.user = User.first
      if p.save
        puts "product #{d['id']} saved!"
      end
    end
  end
end