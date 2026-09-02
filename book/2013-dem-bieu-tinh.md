# Biểu tình ★★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `dem`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/dem>


## Đề bài

Chủ nhật tới, Byteville sẽ tổ chức Ngày Byte thường niên — một trong những lễ hội quan trọng nhất của Byteania. Tuy nhiên, mọi dấu hiệu đều cho thấy lễ kỷ niệm năm nay sẽ không chỉ là một hội hè gia đình yên bình.

Gần đây, người dân Byteville chia rẽ sâu sắc về một vấn đề then chốt. Một số người cho rằng, theo truyền thống, một byte luôn phải bằng tám bit. Nhưng những người ủng hộ tiến bộ lại thích các byte 16 bit có sức chứa lớn hơn nhiều. Những người khác nhìn vấn đề nghiêm khắc hơn hẳn và rất muốn tuyên bố rằng byte luôn chỉ được có 4 bit. Cuối cùng, Byteville còn có những phong trào lật đổ ít quan trọng hơn, mà thành viên của chúng chủ trương rằng số bit trong một byte không nên là lũy thừa của hai, thậm chí không nhất thiết phải là số chẵn! Mỗi hội đoàn đều dự định tổ chức một cuộc biểu tình vào Chủ nhật để thuyết phục người dân Byteville về quan điểm của mình.

Nhiều người dân Byteville lo rằng số lượng biểu tình như thế có thể làm gián đoạn lễ hội Ngày Byte. Thị trưởng Byteville nhận thấy rằng cấm một số cuộc biểu tình có thể đem lại cho ông sự ủng hộ đáng kể của công chúng. Vì quyết định ấy dễ gây tranh cãi, ông quyết định chỉ hủy nhiều nhất hai cuộc biểu tình. Đồng thời, ông muốn chọn các cuộc biểu tình cần hủy sao cho tổng thời gian có bất kỳ cuộc biểu tình nào diễn ra trong thành phố, sau khi hủy, là ngắn nhất có thể. Hãy giúp thị trưởng xác định ông có thể tạo thêm được bao nhiêu thời gian không có biểu tình trong thành phố.

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(n\) \((2\le n\le500\,000)\), là số cuộc biểu tình đã được lên kế hoạch. Mỗi trong \(n\) dòng tiếp theo mô tả một cuộc biểu tình: dòng thứ \(i\) gồm hai số nguyên \(a_i,b_i\) \(0\le a_i<b_i\le10^9\), nghĩa là cuộc biểu tình thứ \(i\) bắt đầu sau lúc mặt trời mọc \(a_i\) byte-phút và kết thúc sau lúc mặt trời mọc \(b_i\) byte-phút.

### Dữ liệu ra

In đúng một số nguyên không âm: khoảng thời gian diễn ra biểu tình có thể được rút ngắn nhiều nhất bao nhiêu nếu thị trưởng Byteville hủy nhiều nhất hai cuộc biểu tình.

### Ví dụ

**Dữ liệu vào**

```text
5
0 9
1 4
2 5
7 9
6 7
```

**Dữ liệu ra**

```text
4
```

Thị trưởng Byteville nên không cấp phép cho cuộc biểu tình thứ nhất và thứ tư.

## Lời giải

Trước hết, hãy xét một nhận xét đơn giản. Nếu trong một khoảng thời gian có ít nhất ba cuộc biểu tình diễn ra, thị trưởng không thể tác động gì đến khoảng ấy: ngay cả sau quyết định của ông, vẫn có ít nhất một cuộc biểu tình đang diễn ra. Vì vậy, ta chỉ quan tâm các khoảng thời gian mà nhiều nhất hai cuộc biểu tình được lên kế hoạch, bởi chỉ tại đó ta mới có thể thay đổi được điều gì đó.

Gọi \(t_1(i)\) là tổng thời lượng mà cuộc biểu tình duy nhất đang diễn ra là cuộc \(i\). Gọi \(t_2(i,j)\) là thời lượng mà chính xác hai cuộc biểu tình \(i\) và \(j\) diễn ra đồng thời, không có cuộc nào khác. Khi đó, nếu thị trưởng hủy các cuộc biểu tình \(i\) và \(j\), ông sẽ tạo được đúng

\[
t_1(i)+t_1(j)+t_2(i,j)
\]

thời gian không có biểu tình.

Hình minh họa trong nguồn gốc xét bốn cuộc biểu tình trên các khoảng \([1,8]\), \([5,10]\), \([7,17]\) và \([12,15]\). Khi đó

\[
t_1(1)=4,\qquad t_1(2)=0,\qquad t_1(3)=4,\qquad t_1(4)=0,
\]

và

\[
t_2(1,2)=t_2(2,3)=2,\qquad t_2(3,4)=3.
\]

![Hình 1. Bốn cuộc biểu tình trên trục thời gian và các đoạn đóng góp vào \(t_1\), \(t_2\).](figures/2013-dem-fig-1.png)

Trong ví dụ này, phương án tối ưu là hủy cuộc biểu tình \(1\) và \(3\): đây là hai cuộc có giá trị \(t_1(\cdot)\) lớn nhất. Lưu ý rằng \(t_2(1,3)=0\).

### Tính các giá trị \(t_1\) và \(t_2\)

Ta tạo một mảng gồm \(2n\) sự kiện dạng “cuộc biểu tình \(i\) bắt đầu/kết thúc tại thời điểm \(t\)” rồi sắp xếp nó không giảm theo thời điểm. Sau đó duyệt các sự kiện đã sắp xếp, tức di chuyển theo trục thời gian từ trái sang phải, đồng thời duy trì tập các cuộc biểu tình đang diễn ra.

Khi gặp sự kiện tiếp theo, nếu hiện tại chỉ có đúng một cuộc biểu tình \(i\) đang diễn ra, ta tăng \(t_1(i)\) thêm khoảng thời gian đã trôi qua kể từ sự kiện trước. Nếu hiện tại có đúng hai cuộc biểu tình \(i\) và \(j\), ta tăng \(t_2(i,j)\), và đối xứng cũng tăng \(t_2(j,i)\), thêm đúng khoảng thời gian đó.

Để lưu tập các cuộc biểu tình đang diễn ra, chẳng hạn ta dùng cấu trúc `set` của thư viện STL. Các giá trị \(t_1(i)\) có thể đặt trong một mảng \(n\) phần tử. Ta không thể làm tương tự với các giá trị \(t_2(i,j)\), vì mảng đó sẽ có kích thước \(n^2\). Tuy vậy, trong quá trình xử lý các sự kiện, ta thực hiện phép tăng một giá trị \(t_2(\cdot,\cdot)\) nhiều nhất \(4n\) lần. Vì thế, có không quá \(4n\) cặp biểu tình \(i,j\) thỏa \(t_2(i,j)>0\). Ta có thể lưu các giá trị này bằng cấu trúc `map` của STL.

Ta sắp xếp \(2n\) sự kiện, rồi với mỗi sự kiện thực hiện một số hằng số thao tác trên cấu trúc dữ liệu, mỗi thao tác tốn \(O(\log n)\). Do đó, việc xác định toàn bộ \(t_1(i)\) và \(t_2(i,j)\) tốn thời gian

\[
O(n\log n).
\]

### Bài toán đồ thị

Bài toán có một cách diễn giải đồ thị hữu ích. Hãy tưởng tượng một đồ thị đầy đủ vô hướng: mọi cặp đỉnh đều được nối bởi một cạnh. Các đỉnh tương ứng với các cuộc biểu tình. Ta gán trọng số cho đỉnh và cạnh: đỉnh ứng với cuộc biểu tình \(i\) có trọng số \(t_1(i)\), còn cạnh nối hai đỉnh \(i,j\) có trọng số \(t_2(i,j)\). Ta cần tìm một cặp đỉnh sao cho tổng trọng số của chúng và trọng số cạnh nối chúng là lớn nhất. Điều quan trọng là đồ thị này có biểu diễn kích thước \(O(n)\), vì chỉ có nhiều nhất \(4n\) cạnh mang trọng số dương.

Từ đây, ta chỉ tập trung vào bài toán đồ thị. Với hai đỉnh \(i,j\), ký hiệu tổng trọng số của chúng và trọng số cạnh nối chúng là

\[
T(i,j):=t_1(i)+t_1(j)+t_2(i,j).
\]

Có rất nhiều cặp đỉnh \(i,j\), nhưng chỉ \(4n\) cạnh có trọng số dương, và ta đã xác định các cặp đó ở pha đầu của thuật toán. Vậy ta có thể duyệt tất cả những cạnh này và chọn cạnh \(ij\) cực đại hóa \(T(i,j)\). Liệu vậy đã xong? Chưa: đây chưa chắc là lời giải tối ưu, vì giá trị lớn nhất của \(T(i,j)\) có thể đạt được ở hai đỉnh được nối bởi một cạnh trọng số \(0\).

Để xét trường hợp này, ta tìm hai đỉnh \(i_0,j_0\) có trọng số lớn nhất, tức cực đại hóa

\[
t_1(i_0)+t_1(j_0).
\]

Kết quả cuối cùng là phương án tốt hơn trong hai phương án vừa xét.

Cần lưu ý một chi tiết: trong trường hợp thứ hai, ta tìm hai trọng số \(t_1\) lớn nhất, nên cuối cùng có thể nhận được hai đỉnh \(i_0,j_0\) nối với nhau bằng một cạnh trọng số dương. Điều đó có gây vấn đề không? Thực ra không. Nếu chỉ xét những cặp đỉnh \(i,j\) được nối bởi cạnh trọng số \(0\), chắc chắn ta không thể có kết quả tốt hơn, vì khi ấy ta tối đa hóa trên một tập nhỏ hơn. Mặt khác, nếu \(i_0\) và \(j_0\) nối với nhau bằng một cạnh trọng số dương, cặp này cũng đã được xét ở pha đầu của thuật toán. Hơn nữa, lợi ích từ cặp đó là

\[
t_1(i_0)+t_1(j_0)+t_2(i_0,j_0),
\]

lớn hơn \(t_1(i_0)+t_1(j_0)\), vì \(t_2(i_0,j_0)>0\).

Như vậy, ta đã chứng minh tính đúng đắn của thuật toán. Một phân tích đơn giản cho thời gian chạy bị chặn bởi

\[
O(n\log n).
\]

## Lời cuối

Khi chuẩn bị bài này cho cuộc thi, chúng tôi từng cân nhắc thêm một yêu cầu thứ hai: chọn hai cuộc biểu tình mà sau khi hủy, tổng thời gian có biểu tình trong thành phố là **dài nhất**. Trong diễn giải đồ thị, khi đó ta sẽ tìm cặp đỉnh \(i,j\) tối thiểu hóa

\[
T(i,j)=t_1(i)+t_1(j)+t_2(i,j).
\]

Thoạt nhìn, bài toán có vẻ đối xứng với bài toán đang xét, nhưng thực tế khó hơn một chút. Giống như trước, lời giải sẽ có hai phần: xét \(O(n)\) cặp đỉnh được nối bằng cạnh trọng số dương — phần này không thay đổi — rồi chọn trong các cặp còn lại một cặp tối thiểu hóa tổng trọng số \(t_1\) của hai đỉnh.

Tuy nhiên, lần này ở phần thứ hai ta không thể chỉ chọn hai đỉnh có trọng số nhỏ nhất, bởi cạnh trọng số dương có thể nối chúng và khiến chúng không cho kết quả nhỏ nhất. May mắn là có thể tiếp cận phần này theo cách khác và thu được thuật toán chạy trong \(O(n\log n)\). Việc hoàn thiện ý tưởng này được để lại cho bạn đọc suy ngẫm.
