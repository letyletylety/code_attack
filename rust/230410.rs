impl Solution {
    pub fn is_valid(s: String) -> bool {
        let v: Vec<char> = Vec::new();
        let open = "([{";
        let close = ")]}";

        for i in s.chars() {
            if let posc = close.chars().position(|x| x == i) {
                if let Some(t) = v.pop() {
                    let poso = close.chars().position(|x| x == t);

                    if poso != posc {
                        return false;
                    }
                }
            } else if let poso = open.chars().position(|x| x == i) {
                v.push(i);
            } else {
                // wrong
            }
        }

        v.is_empty()
    }
}
struct Solution {}

fn main() {
    use Solution;
    let sol = Solution::new();
    println!("{}", sol.is_valid("()"));
}
