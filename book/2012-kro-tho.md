# Thỏ ★★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Jakub Radoszewski  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `kro`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/kro>


## Đề bài

Byteasar quyết định sống xanh hơn và trồng xà lách trong vườn. Như bạn có thể hình dung, những chú thỏ Bytean rất thích xà lách, nên chẳng có gì lạ khi chúng lập tức kéo đến khu vườn của Byteasar.

Trong vườn có \(n\) luống xà lách, được đánh số từ \(1\) đến \(n\). Hai luống liên tiếp bất kỳ là kề nhau: với mọi \(i=1,2,\ldots,n-1\), luống \(i\) kề luống \(i+1\); ngoài ra, luống \(n\) kề luống \(1\). Hiện tại có \(a_i\) con thỏ đang ở luống \(i\) và ăn xà lách của Byteasar.

Byteasar muốn đuổi khỏi vườn được nhiều thỏ nhất có thể. Ông sẽ dùng khẩu súng cũ của mình, trong đó có \(k\) viên đạn. Thỏ cực kỳ nhút nhát: mỗi khi Byteasar bắn vào luống \(i\), toàn bộ thỏ tại luống đó sẽ vĩnh viễn chạy khỏi vườn. Hơn nữa, thỏ ở **cả hai luống kề** đều hoảng sợ và di chuyển sang luống kế tiếp ở phía còn lại — tức là luống kề với luống chúng đang ở, nhưng khác luống vừa bị bắn.

Hãy giúp Byteasar tìm số thỏ lớn nhất có thể đuổi khỏi vườn bằng không quá \(k\) phát súng.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n\) và \(k\) (\(5\le n\le2\,000\), \(1\le k\le n\)), lần lượt là số luống xà lách và số viên đạn trong súng.

Dòng thứ hai chứa \(n\) số nguyên \(a_1,a_2,\ldots,a_n\) (\(0\le a_i\le1\,000\,000\)), trong đó \(a_i\) là số thỏ ở luống thứ \(i\).

### Dữ liệu ra

In một số nguyên: số thỏ lớn nhất có thể đuổi khỏi vườn bằng không quá \(k\) phát súng.

### Ví dụ

**Dữ liệu vào**

```text
5 2
6 1 5 3 4
```

**Dữ liệu ra**

```text
13
```

**Giải thích.** Đầu tiên Byteasar đuổi 6 con thỏ khỏi luống \(1\). Khi đó thỏ từ luống \(5\) di chuyển sang luống \(4\), còn thỏ từ luống \(2\) di chuyển sang luống \(3\). Sau đó ông bắn vào luống \(4\) và đuổi được 7 con thỏ.

## Lời giải

Để mô tả ngắn gọn, từ đây ta gọi các luống là **ô**. Trước hết, hãy xác định số phát súng chắc chắn đủ để đuổi hết thỏ. Nếu \(n\) chẵn, ta chỉ việc lần lượt bắn vào mọi ô mang số lẻ. Thỏ từ các ô chẵn liên tiếp sẽ nhảy sang những ô lẻ kế tiếp, rồi bị đuổi đi bởi các phát súng sau đó. Tương tự, khi \(n\) lẻ, chỉ cần

\[
\left\lceil\frac n2\right\rceil
\]

phát súng.

Quan sát này gợi ý rằng bắn vào mỗi ô cách một ô là một ý tưởng tốt. Ta sẽ chính xác hóa trực giác ấy.

### Phân tích trường hợp tổng quát

Hãy hình dung một lời giải tối ưu sử dụng đúng \(k\) phát súng. Gọi một ô là **sạch** nếu, sau \(k\) phát súng đó, các con thỏ ban đầu ở ô này đã bị đuổi đi thành công. Khái niệm này không chỉ bao gồm các ô bị bắn khi vẫn có thỏ: thỏ ban đầu ở một ô có thể đã nhảy sang ô khác rồi chỉ sau đó mới bị đuổi. Chia các ô trên vòng tròn thành các đoạn cực đại gồm toàn ô sạch.

![Một vòng gồm \(n=18\) ô với \(k=6\) phát súng: vòng tròn đen ghi thứ tự bắn, mũi tên chỉ hướng thỏ nhảy, và các ô tô màu là ô sạch.](figures/2012-kro-fig-1.png)

Trong hình có ba đoạn sạch cực đại.

Ta đã xét trường hợp đuổi được tất cả thỏ: khi đó chỉ có một đoạn bao phủ toàn bộ các ô. Phân tích trên cho thấy \(\left\lceil n/2\right\rceil\) phát súng là đủ. Số này cũng là cần thiết. Thật vậy, nếu bắn ít hơn, một phép đếm đơn giản cho thấy giữa hai ô liên tiếp bị bắn nào đó phải có một khoảng trống gồm ít nhất hai ô. Khi đó không thể đuổi thỏ từ bất kỳ ô nào trong khoảng trống ấy.

Từ giờ, giả sử các đoạn sạch không phủ hết các ô. Chúng có thể có dạng nào? Chẳng hạn, liệu có thể có hai đoạn sạch chỉ cách nhau đúng một ô không sạch? Không. Giả sử có hai đoạn như thế. Muốn đuổi thỏ ban đầu ở ô ngoài cùng bên phải của đoạn bên trái, ta bắt buộc phải bắn vào chính ô ấy. Tương tự, phải bắn vào ô ngoài cùng bên trái của đoạn bên phải. Chỉ xét hai phát súng này: khi phát thứ nhất trong chúng được bắn, thỏ ở ô nằm giữa hai đoạn sẽ nhảy vào ô bị nhắm bởi phát thứ hai. Vì vậy chúng bị đuổi bởi phát thứ hai, mâu thuẫn với giả thiết ô giữa không sạch. Lập luận tương tự cũng cho thấy không thể có đúng một đoạn sạch dài \(n-1\).

Vì thế, các khoảng cách giữa những đoạn sạch cực đại đủ lớn để phát súng trong một đoạn không ảnh hưởng tới diễn biến ở các đoạn khác. Ta có thể xét từng đoạn độc lập. Lấy một đoạn gồm \(m\) ô, trước tiên giả sử \(m\) lẻ. Để đuổi hết thỏ trong đoạn này, khoảng trống giữa hai ô liên tiếp bị bắn không được chứa quá một ô. Do đó, cần và đủ đúng

\[
\left\lceil\frac m2\right\rceil
\]

phát súng, bắn vào mỗi ô cách một ô. Điều thú vị là các phát súng khi ấy có thể thực hiện theo bất kỳ thứ tự nào; ta không chứng minh riêng tính chất này.

Nếu \(m\) chẵn, cần \(m/2+1\) phát súng. Nhưng không cần xét trường hợp này: cùng số phát súng đó có thể làm sạch một đoạn dài hơn gồm \(m+1\) ô.

Tóm lại:

- Nếu \(k\ge\left\lceil n/2\right\rceil\), ta có thể đuổi hết thỏ.
- Nếu \(k<\left\lceil n/2\right\rceil\), ta chỉ cần xét một số đoạn rời nhau từng đôi có độ dài lẻ, và trong mỗi đoạn bắn vào đúng mỗi ô cách một ô.

Vì vậy, trong trường hợp thứ hai, ta có thể giới hạn ở các lời giải thỏa hai tính chất sau:

1. Mọi cặp ô bị bắn cách nhau ít nhất một ô, tức chỉ số của chúng không kề nhau trên vòng tròn.
2. Không phát bắn nào làm thỏ từ một ô nhảy xa hơn ô kề nó.

Do đó, tại mọi thời điểm số thỏ ở một ô chỉ phụ thuộc vào các phát bắn trong phạm vi nhiều nhất hai ô quanh nó. Đây là nền tảng cho quy hoạch động dưới đây.

### Quy hoạch động

Các quan sát trên cho phép xây dựng lời giải hiệu quả. Ta duyệt lần lượt các ô và ở mỗi ô xét khả năng bắn vào nó. Có một chi tiết nhỏ: các ô tạo thành vòng tròn, nên các phát bắn ở đầu dãy có thể ảnh hưởng đến thỏ ở cuối dãy. Ta kiểm soát điều này bằng cách nhớ liệu đã bắn vào một trong hai ô đầu tiên hay chưa.

Trước tiên xét phiên bản trên **đoạn thẳng**, trong đó ô \(1\) không kề ô \(n\). Trạng thái quy hoạch động được chỉ số hóa bởi:

- số ô đã xét \(i\in\{1,\ldots,n\}\);
- số phát súng đã dùng \(j\in\{0,\ldots,k\}\);
- thông tin về các phát bắn ở hai ô gần nhất.

Với mỗi trong \(3n(k+1)\) trạng thái, ta lưu số thỏ lớn nhất đã đuổi được. Có ba loại trạng thái:

1. phát bắn cuối cùng là vào ô \(i\);
2. phát bắn cuối cùng là vào ô \(i-1\);
3. phát bắn cuối cùng là vào một ô có số nhỏ hơn \(i-1\), hoặc chưa bắn phát nào.

Gọi \(t_a[i,j]\), với \(a\in\{1,2,3\}\), là giá trị tốt nhất của trạng thái loại \(a\). Với \(i>1\), các công thức chuyển là

\[
\begin{aligned}
t_1[i,j] &= \max\bigl(t_2[i-1,j-1]+a_{i-1}+a_i,\;t_3[i-1,j-1]+a_i\bigr),\\
t_2[i,j] &= t_1[i-1,j],\\
t_3[i,j] &= \max\bigl(t_2[i-1,j],\;t_3[i-1,j]\bigr).
\end{aligned}
\]

Hãy giải thích công thức đầu tiên. Nó mô tả trường hợp bắn vào ô \(i\). Nếu phát bắn trước đó là vào ô \(i-2\) — tương ứng trạng thái \(t_2[i-1,j-1]\) — thì thỏ từ ô \(i-1\) đã chuyển sang ô \(i\). Phát hiện tại vì thế đuổi được \(a_{i-1}+a_i\) con. Nếu phát trước đó nhắm vào một ô nhỏ hơn \(i-2\), hoặc chưa có phát bắn nào — trạng thái \(t_3[i-1,j-1]\) — thì ô \(i\) vẫn chỉ có \(a_i\) con thỏ, nên ta chỉ đuổi được số đó. Theo các quan sát trước, không cần xét trường hợp phát bắn trước đó là vào ô \(i-1\).

Để trở lại vòng tròn, mở rộng bảng thêm một chiều ghi nhận có phát bắn nào vào ô \(1\) hoặc \(2\) hay không, rồi xét thông tin này khi tính các trạng thái với \(i\in\{n-1,n\}\). Mỗi trạng thái tính được trong thời gian hằng số, nên toàn bộ thuật toán chạy trong

\[
O(nk)
\]

thời gian.
