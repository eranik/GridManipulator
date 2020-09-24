#include <bitset>
#include <cstdarg>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <tuple>
#include <vector>

using namespace std;

class GridManipulator {
public:
  GridManipulator() = delete;
  GridManipulator(const GridManipulator &) = delete;
  GridManipulator &operator=(const GridManipulator &) = delete;

  template <bool do_safety_check = false>
  static constexpr tuple<bool, uint16_t> get_zero_count(unsigned char grid[]) {
    if constexpr (do_safety_check) {
      if (grid_safety_check(grid) == false)
        return {false, 0};
    }

    uint16_t res = 0;
    for (uint8_t i = 0; i < LEN * 2; i++) {
      uint8_t mask = 1;
      for (uint8_t j = 0; j < 8; j++) {
        if ((grid[i] & mask) == 0)
          res += 1;
        mask <<= 1;
      }
    }
    return {true, res};
  }

  template <bool do_safety_check = false>
  static bool update(unsigned char grid[], const uint8_t operation) {
    return update<do_safety_check>(grid, {operation});
  }

  template <bool do_safety_check = false>
  static bool update(unsigned char grid[],
                     std::initializer_list<const uint8_t> operations) {
    if constexpr (do_safety_check) {
      bool ok = true;
      ok = ok && grid_safety_check(grid);
      ok = ok && ops_safety_check(operations);
      if (ok == false)
        return false;
    }

    uint16_t *const girdHelper = reinterpret_cast<uint16_t *const>(grid);
    for (auto &op : operations) {
      update_grid(girdHelper, get_row(op), get_col(op));
    }
    return true;
  }

  template <bool with_line_no = true>
  static inline void print_grid(const unsigned char *const grid) {
    const uint16_t *const girdHelper =
        reinterpret_cast<const uint16_t *const>(grid);
    if constexpr (with_line_no)
      cout << endl << "\t0123456789abcdef" << endl << endl;
    for (int i = 0; i < LEN; i++) {
      if constexpr (with_line_no)
        cout << dec << i << "\t";
      cout << bitset<16>(girdHelper[i]) << endl;
    }
  }

  static constexpr uint8_t LEN = 16;

private:
  static constexpr uint8_t get_row(const uint8_t addr) noexcept {
    return (addr & 0xf0) >> 4;
  }

  static constexpr uint8_t get_col(const uint8_t addr) { return addr & 0x0f; }

  static constexpr uint16_t get_col_mask(const uint8_t col) {
    return static_cast<uint16_t>(1 << 15) >> col;
  }

  static inline void update_grid(uint16_t *const girdHelper, const uint8_t row,
                                 const uint8_t col) noexcept {
    if ((girdHelper[row] & get_col_mask(col)) == 0) {
      update_row_col(girdHelper, row, col);
    } else // set diagonal
    {
      update_diagonal(girdHelper, row, col);
    }
  }

  static inline void update_row_col(uint16_t *const girdHelper,
                                    const uint8_t row,
                                    const uint8_t col) noexcept {
    // set row bits to ones
    girdHelper[row] = numeric_limits<uint16_t>::max();

    for (int i = 0; i < LEN; i++) {
      girdHelper[i] |= get_col_mask(col);
    }
  }

  static inline void update_diagonal(uint16_t *const girdHelper,
                                     const uint8_t row,
                                     const uint8_t col) noexcept {
    for (uint8_t i = 0; i < LEN; i++) {
      // down right
      if (((row + i) < LEN) && ((col + i) < LEN)) {
        girdHelper[row + i] &= ~get_col_mask(col + i);
      }
      // down left
      if (((row + i) < LEN) && ((col - i) >= 0)) {
        girdHelper[row + i] &= ~get_col_mask(col - i);
      }
      // up right
      if (((row - i) >= 0) && ((col + i) < LEN)) {
        girdHelper[row - i] &= ~get_col_mask(col + i);
      }
      // up left
      if (((row - i) >= 0) && ((col - i) >= 0)) {
        girdHelper[row - i] &= ~get_col_mask(col - i);
      }
    }
  }

  static inline bool grid_safety_check(const unsigned char grid[]) noexcept {
    // TODO
    // suppress unused warning
    (void)grid;
    return true;
  }

  static inline bool ops_safety_check(
      const std::initializer_list<const uint8_t> &operations) noexcept {
    // TODO
    // suppress unused warning
    (void)operations;
    return true;
  }
};

// TODO: add tests
void simple_tests() {
  // Assumption of assignment
  unsigned char grid[32] = {0};

  // GridManipulator::update(grid, 0xff);
  // GridManipulator::print_grid(grid);
  // GridManipulator::update(grid, 0x11);
  // GridManipulator::print_grid(grid);
  // GridManipulator::update(grid, 0x12);
  // GridManipulator::print_grid(grid);
  // auto[ok, count] = GridManipulator::get_zero_count(grid);
  // if (ok) cout << count << endl;

  GridManipulator::update(grid, {0xff, 0x11, 0x12});
  GridManipulator::print_grid<false>(grid);
  auto [ok, count] = GridManipulator::get_zero_count(grid);
  if (ok)
    cout << count << endl;
}

int main(int argc, char **argv) {
  // simple_tests();

  if (argc < 2) {
    cout << "Please provide file path to read from." << endl;
    return 0;
  }

  // Assumption of assignment
  unsigned char grid[32] = {0};

  // TODO: sanity check on input before using
  std::ifstream myfile(argv[1], ios::in | ios::binary);
  char c;
  while (myfile.get(c)) {
    // printf("|%hhx|\n", static_cast<uint8_t>(c));
    GridManipulator::update(grid, static_cast<uint8_t>(c));
  }
  auto [ok, count] = GridManipulator::get_zero_count(grid);
  if (ok)
    cout << count << endl;
  return 0;
}
