import 'package:bcrypt/bcrypt.dart' as bcrypt;
import 'package:flutter_test/flutter_test.dart';

void main() => group('Hash', () {
      test('Hash', () async {
        final salt = bcrypt.BCrypt.gensalt();
        final hash = bcrypt.BCrypt.hashpw('hello', salt);
        
        const password =
            "\$2a\$10\$aG.I4V7iqHUhQVXVKzaCg.6AzU0jm5VPtO6zBCxW1DfQ1n72shsL2";
        final verify = bcrypt.BCrypt.checkpw('hello', password);
        print('Result: ${verify}');
      });
    });
